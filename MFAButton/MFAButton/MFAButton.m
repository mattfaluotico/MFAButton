//
//  MFAButton.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "MFAButton.h"
#import "GENERIC.h"
#import "POP/pop.h"

@interface MFAButton() {
    void (^EventBlock)();
}

@property FrontButton *frontButton;
@property BackgroundView *backgroundView;
@property NSMutableArray *optionLabels;
@property bool isList;
@property bool isOpen;
@property MFAButtonPosition position;

@end

#pragma mark - Constants for OptionPlacement spacing

const CGFloat s_frontButtonMargin = 15;
const CGFloat s_optionLabelSideMargin = 0;
const CGFloat s_betweenOptionLabels = 15;

// -------------------------------------------------------

#pragma mark - Implementation and Building

@implementation MFAButton

- (id) initAsSingleActionButton {
    return nil;
}

- (id) initAsOptionListButton {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    self.backgroundView = nil;
    self.frontButton    = nil;
//    [self addSubview:self.backgroundView];
//    [self addSubview:self.frontButton];
    self.clipsToBounds = YES;
    _isOpen = NO;
    _isList = YES;
        
    self.optionLabels = [[NSMutableArray alloc] init];
    
    [self.frontButton addTarget:self action:@selector(performButtonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.frontButton];

    return self;
}

// Add an option from an alraedy created OptionLabel Object
- (void) addOption:(OptionLabel *) optionView {
    [self.optionLabels addObject:optionView];
}

// Creates an OptionLabel from a view and an event
- (void) addOption: (UIView *) view withEvent: (void (^)())event {
    // TODO: Init option label with view
    OptionLabel *n = [[OptionLabel alloc] initWithView:view andEventBlock:event];
    [self addOption:n];
}

// Sets the event for a button
- (void) setButtonEvent: (void (^)())event {
    EventBlock = event;
    [self.frontButton addTarget:self action:@selector(performButtonEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setFrontButton: (FrontButton *) button WithPosition: (MFAButtonPosition) position {
    self.frontButton = button;
    [self addSubview:self.frontButton];
}

#pragma mark - Private Helpers

- (void) performButtonEvent {

    if (_isList) {
        if (_isOpen) {
            EventBlock();
        } else {
            [self launchButtonList];
            _isOpen = YES;
        }
    } else {
        EventBlock();
    }
}

- (void) launchButtonList {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat positionX;
    CGFloat positionY = screen.size.height - s_frontButtonMargin - self.frontButton.frame.size.height;
    
    self.backgroundView = [[BackgroundView alloc] init];
    [self addSubview:_backgroundView];
    [self insertSubview:self.backgroundView belowSubview:self.frontButton];
    
//    UITapGestureRecognizer *clearBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearListFromView)];
//    [self.backgroundView addGestureRecognizer:clearBackground];
    self.backgroundView.backgroundColor = [UIColor colorWithRed:0.3 green:0.2 blue:0.7 alpha:0.33];
    
    //TODO: Fade in background

    NSInteger i = 0;
    for (OptionLabel *v in _optionLabels) {
        // Update Frame
        positionX = screen.size.width - s_optionLabelSideMargin - v.frame.size.width;
        positionY = positionY - s_betweenOptionLabels - v.frame.size.height;
        v.frame = CGRectMake(positionX, positionY, v.frame.size.width, v.frame.size.height);
        v.alpha = 0;
        [self.backgroundView addSubview:v];
        [self a_animateOption:v InWithIndex:i];
        i++;
    }
}

- (void) clearListFromView {
    NSInteger index = [self.optionLabels count];
    [self a_fadeOutBackground];
}

#pragma mark - Handle clicking

// Passes a click through the view.
-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self)
        return nil;
    else
        return hitView;
}

#pragma mark - Animation

- (void) a_animateOption: (OptionLabel *) label InWithIndex: (NSInteger) index {
    POPBasicAnimation *fadeIn = [POPBasicAnimation new];
    POPBasicAnimation *slideUp = [POPBasicAnimation new];
    
    CGFloat duration = 0.3;
    
    fadeIn.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    fadeIn.fromValue = @0;
    fadeIn.toValue = @1;
    fadeIn.duration = duration;
    fadeIn.beginTime = CACurrentMediaTime() + (index * 0.06);
    
    slideUp.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
    CGPoint center = label.center;
    slideUp.fromValue = [NSValue valueWithCGPoint:CGPointMake(center.x, center.y + 5)];
    slideUp.toValue = [NSValue valueWithCGPoint:center];
    slideUp.duration = duration;
    slideUp.beginTime = CACurrentMediaTime() + (index * 0.06);
    
    [label pop_addAnimation:fadeIn forKey:[NSString stringWithFormat:@"fadeIn%li", (long)index]];
    [label pop_addAnimation:slideUp forKey:[NSString stringWithFormat:@"slideUpn%li", (long)index]];
}

- (void) a_fadeInBackground {
    
}

- (void) a_fadeOutBackground{
    
    POPBasicAnimation *fadeOut = [POPBasicAnimation new];
    
    fadeOut.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    fadeOut.fromValue = @1;
    fadeOut.toValue = @0;
    fadeOut.duration = 0.2;
    
    [fadeOut setCompletionBlock:^(POPAnimation *b, BOOL c) {
        [self.backgroundView removeFromSuperview];
        self.backgroundView = nil;
        _isOpen = NO;
    }];
    
    [self.backgroundView pop_addAnimation:fadeOut forKey:@"background"];
}


@end
