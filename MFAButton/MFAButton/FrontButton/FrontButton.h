//
//  FrontButton.h
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFAButton.h"

@interface FrontButton : UIButton

- (void) initWithMainView: (UIView *) andToView: (UIView *) toView andEventBlock: (void (^)())event;

@end
