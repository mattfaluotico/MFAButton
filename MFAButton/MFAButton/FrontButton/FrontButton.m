//
//  FrontButton.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "FrontButton.h"

@implementation FrontButton



- (id) init {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self = [super initWithFrame:CGRectMake(screen.size.width - 70,
                                           screen.size.height - 70,
                                           50,
                                           50)];
    self.layer.cornerRadius = 25;
    [self setTitle:@"+" forState:UIControlStateNormal];
    self.backgroundColor = [UIColor redColor];
    [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.userInteractionEnabled = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    return self;
}

- (void) updateFrame {
    self.frame = CGRectMake(30, 30, 100, 100);
}



@end
