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
    
    // TODO: Add option to background view to speed things up?
}

- (void) addOption: (UIView *) view withEvent: (void (^)())event {
    // TODO: Init option label with view
    OptionLabel *n;
    
}

- (void) setButtonEvent {
    
}

#pragma mark - Private Helpers

- (void) performButtonEvent {
    
}

- (void) launchButtonList {
    
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
