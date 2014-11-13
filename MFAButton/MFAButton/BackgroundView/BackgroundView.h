//
//  BackgroundView.h
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionLabel.h"

@interface BackgroundView : UIView

@property UIColor *backgroundColor;
@property bool *blur;

- (id) initWithBackgroundColor: (UIColor *) color andViewShouldBeBlurry: (bool) blur;

@end
