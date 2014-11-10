//
//  BackgroundView.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (id) init {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = NO;
    return self;
};

@end
