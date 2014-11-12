//
//  MFAButton.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "MFAButton.h"
#import "OptionLabel.h"
#import "POP/pop.h"

@interface MFAButton() {
    void (^EventBlock)();
}

@property FrontButton *frontButton;
@property BackgroundView *backgroundView;

@property bool isOpen;

@end

@implementation MFAButton

- (id) initWithSingleActionButton {
    return self;
};

- (id) initWithActionListButton {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    self.backgroundView = nil;
    self.frontButton    = [[FrontButton alloc] init];
    [self addSubview:self.backgroundView];
    [self addSubview:self.frontButton];
    self.clipsToBounds = YES;
    _isOpen = NO;
    [self.frontButton addTarget:self action:@selector(performEvent) forControlEvents:UIControlEventTouchUpInside];
    return self;
};

- (void) setEvent: (void (^)())event {
    EventBlock = event;
}

- (void) performEvent {
    if (_isOpen) {
        NSLog(@"Pressed");
    } else {
        [self launchTestList];
    }
}

- (void) launchTestList {
    
    // Sets the background view
    self.backgroundView = [[BackgroundView alloc] init];
    self.backgroundView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
    [self insertSubview:self.backgroundView belowSubview:self.frontButton];
    
    self.backgroundView.alpha = 0;
    [self fadeInBackground];
    
    // Sets the list elements
    CGRect screen = [[UIScreen mainScreen] bounds];
    OptionLabel *one = [[OptionLabel alloc] initWithLabelIndex:1 Text:@"Really fucking big Cactus" image:[UIImage imageNamed:@"moose"] andEvent:nil];
    OptionLabel *three = [[OptionLabel alloc] initWithLabelIndex:3 Text:@"The biggest cactus of all. Like it's so big." image:nil andEvent:nil];
    OptionLabel *four = [[OptionLabel alloc] initWithLabelIndex:4 Text:@"Tiny" image:nil andEvent:nil];
    OptionLabel *main = [[OptionLabel alloc] initWithLabelIndex:0 Text:@"Really fucking big Cactus" image:nil andEvent:nil];
    OptionLabel *two = [[OptionLabel alloc] initWithLabelIndex:2 Text:@"Bigger Cactus" image:[UIImage imageNamed:@"moose"] andEvent:^{
        NSLog(@"hello!");
    }];
    
    
    [self.backgroundView addSubview:one];
    [self fadeInOptions:one];
    [self.backgroundView addSubview:main];
    [self fadeInOptions:main];
    [self.backgroundView addSubview:two];
    [self fadeInOptions:two];
    [self.backgroundView addSubview:three];
    [self fadeInOptions:three];
    [self.backgroundView addSubview:four];
    [self fadeInOptions:four];
    
    UITapGestureRecognizer *clear = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearBackgroundLayer)];
    [self.backgroundView addGestureRecognizer:clear];
    
    _isOpen = YES;
}

# pragma Mark - Set Parameters

- (void) setButtonPosition:(MFAButtonPosition *)ButtonPosition {
    
}

# pragma mark Handle hits to view

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self)
        return nil;
    else
        return hitView;
}

-(void) clearBackgroundLayer {
    [self fadeOutBackground];
    _isOpen = NO;
}

#pragma mark - update?

- (void) newInit {
    
}

- (void) fadeInBackground {
    POPBasicAnimation *fadeIn = [POPBasicAnimation new];
    POPBasicAnimation *fadeInColor = [POPBasicAnimation new];
    fadeInColor.property = [POPAnimatableProperty propertyWithName:kPOPViewBackgroundColor];
    fadeIn.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    fadeIn.fromValue = @(0);
    fadeIn.toValue = @(1);
    fadeInColor.fromValue = [UIColor whiteColor];
    fadeInColor.toValue = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.backgroundView pop_addAnimation:fadeInColor forKey:@"fadeInColor"];
    [self.backgroundView pop_addAnimation:fadeIn forKey:@"fadeIn"];
    
}

- (void) fadeOutBackground {
    POPBasicAnimation *fadeOut = [POPBasicAnimation new];
    fadeOut.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    fadeOut.fromValue = @(1);
    fadeOut.toValue = @(0);
    [self.backgroundView pop_addAnimation:fadeOut forKey:@"fadeOut"];
    
    [fadeOut setCompletionBlock:^(POPAnimation * fadeOut, BOOL value) {
        [self.backgroundView removeFromSuperview];
        self.backgroundView = nil;
    }];
}

- (void) fadeInOptions: (UIView *) v {
    POPBasicAnimation *fadeIn = [POPBasicAnimation new];
    fadeIn.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    CGRect fromFrame = v.frame;
    fromFrame.origin.y+=10;
    fadeIn.fromValue = [NSValue valueWithCGRect:fromFrame];
    fadeIn.toValue = [NSValue valueWithCGRect:v.frame];
    [v pop_addAnimation:fadeIn forKey:@"fadeOption1"];
}

- (void) addOption {
}

- (void) setButtonEvent {
    
}

- (void) performButtonEvent {
    
}


@end
