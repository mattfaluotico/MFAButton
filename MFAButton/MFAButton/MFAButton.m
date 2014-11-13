//
//  MFAButton.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "MFAButton.h"
#import "OptionLabel.h"

@interface MFAButton() {
    void (^EventBlock)();
}

@property FrontButton *frontButton;
@property BackgroundView *backgroundView;
@property NSMutableArray *optionLabels;
@property bool isList;
@property bool isOpen;

@end

#pragma mark - Constants for OptionPlacement spacing

const CGFloat s_frontButtonMargin = 20;
const CGFloat s_optionLabelLRMargin = 20;
const CGFloat s_betweenOptionLabels = 15;

// -------------------------------------------------------

#pragma mark - Implementation

@implementation MFAButton

- (id) initAsSingleActionButton {
    return nil;
}

- (id) initAsActionListButton {
    return nil;
}

- (void) addOption:(OptionLabel *) optionView {
    [self.optionLabels addObject:optionView];
}

- (void) addOption: (UIView *) view withEvent: (void (^)())event {
    // TODO: Init option label with view
    OptionLabel *n = [[OptionLabel alloc] initWithView:view andEventBlock:event];
    [self addOption:n];
}

- (void) setButtonEvent: (void (^)())event {
    EventBlock = event;
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
    
    NSInteger optionIndex = 0;
    for (OptionLabel *v in _optionLabels) {
        // Update Frame
        positionX = screen.size.width - s_optionLabelLRMargin - v.frame.size.width;
        positionY = positionY - s_betweenOptionLabels - v.frame.size.height;
        v.frame = CGRectMake(positionX, positionY, v.frame.size.width, v.frame.size.height);
        [self.backgroundView addSubview:v];
        // TODO: Add animation
    }
}

#pragma mark - Animation

- (void) a_fadeInOptions {
    
}

- (void) a_fadeOutOptions {
    
}

- (void) a_fadeInBackground {
    
}

- (void) a_fadeOutBackground {
    
}

- (void) a_shrinkViewOnTouchDown {
    
}

- (void) a_restoreViewOnTouchUp {
    
}


@end
