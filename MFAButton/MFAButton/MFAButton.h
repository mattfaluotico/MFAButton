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

/*
 
 Properties
 --- Background
 - Background Blur
 - Color
 --- Button
 - Color
 - Default Label
 - Active Label
 - Default Event
 - Active Event
 */

typedef NS_ENUM(NSInteger, MFAButtonPosition) {
    MFAButtonPositionCenter,
    MFAButtonPositionLeft,
    MFAButtonPositionRight
};

@interface MFAButton : UIView

// Button Properties

@property MFAButtonPosition *ButtonPosition;
@property UIColor *ButtonColor;
@property UIColor *ButtonLabelColor;
@property UILabel *ButtonDefaultLabel;
@property UILabel *ButtonActiveLabel;

// Background Properties


// Create a FAButton that has a single action.
- (id) initWithSingleActionButton;

// Create a FAB button that generates a list of potential action.
- (id) initWithActionListButton;

// Sets the event to be performed when button is in active state or button is a single action button
- (void) setEvent: (void (^)())event;


@end
