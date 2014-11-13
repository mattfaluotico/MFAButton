//
//  MFAButton.h
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrontButton.h"
#import "BackgroundView.h"
#import "OptionLabel.h"

typedef NS_ENUM(NSInteger, MFAButtonPosition) {
    MFAButtonPositionCenter,
    MFAButtonPositionLeft,
    MFAButtonPositionRight
};

@interface MFAButton : UIView

@property MFAButtonPosition *ButtonPosition;
@property UIView *buttonView;

#pragma mark - Init methods

// Create a FAButton that has a single action.
- (id) initAsSingleActionButton;

// Create a FAB button that generates a list of potential action.
- (id) initAsActionListButton;

// ---------------------------------------------

// Sets the event to be performed when button is in active state or button is a single action button
- (void) setButtonEvent: (void (^)())event;

// Add an option (must be a list)
- (void) addOption:(OptionLabel *) optionView;

// Add option without creating an object instance
- (void) addOption: (UIView *) view withEvent: (void (^)())event;

// Sets the view for the button
- (void) setInitButtonView:(UIView *)buttonView;

// Button view I will animate to.
- (void) setActionButtonView:(UIView *)buttonView;

// ---------------------------------------------------


@end
