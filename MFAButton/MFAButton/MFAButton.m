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

- (void) setButtonView:(UIView *)buttonView {
    
}

- (void) fadeOutBackground {
    
}

- (void) fadeInOptions {
    
}

- (void) addOption:(OptionLabel *) optionView {
    
}

- (void) setButtonEvent {
    
}

- (void) performButtonEvent {
    
}


@end
