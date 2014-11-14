//
//  GENERIC.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/12/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "GENERIC.h"

@implementation GENERIC

+ (FrontButton *) genericFrontButtonWithDefaultText: (NSString *) defaultText
                                         activeText: (NSString *) activeText
                                           andColor: (UIColor*) c {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    FrontButton *button = [[FrontButton alloc] initWithFrame:CGRectMake(screen.size.width - 75,
                                           screen.size.height - 75,
                                           60,
                                           60)];
 
    button.layer.cornerRadius = 30;
    [button setTitle:defaultText forState:UIControlStateNormal];
    button.backgroundColor = c;
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    // Set shadow
    button.layer.shadowRadius = 3;
    button.layer.shadowOpacity = 0.6;
    button.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    button.layer.shadowOffset = CGSizeMake(0, 2);
    
    return button;

}

+ (OptionLabel *) genericOptionLabelWithText: (NSString *) text
                                imageForIcon: (UIImage *) image
                                    andEvent:(void (^)())event {
    
    // Init the stuff...
    CGSize textSize = [text sizeWithAttributes:
                       @{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
    CGSize labelSize = CGSizeMake(textSize.width + (2 * 10), 27);
    
    CGRect masterFrame = CGRectMake(0, 0, labelSize.width, labelSize.height);
    
    masterFrame.size.height = 45;
    masterFrame.size.width+= 100;
    
    // Label Outline
    UIView *labelOutline = [[UIView alloc] initWithFrame:CGRectMake(0, 9, labelSize.width, labelSize.height)];
    
    OptionLabel *optionLabal = [[OptionLabel alloc] initWithFrame:masterFrame];
    labelOutline.backgroundColor = [UIColor whiteColor];
    labelOutline.layer.cornerRadius = 5;
    optionLabal.optionText = text;
    optionLabal.optionImage = image;
    [optionLabal setEventBlock:event];
    
    // Set Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.textColor = [UIColor darkGrayColor];
    label.text = text;

    // Button is 60
    // Margin is 15
    // That means the Center is at screen-40
    
    // set the shadow
    labelOutline.layer.shadowRadius = 3;
    labelOutline.layer.shadowOpacity = 0.6;
    labelOutline.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    labelOutline.layer.shadowOffset = CGSizeMake(0, 2);
    
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.layer.cornerRadius = 22.5;
        imageView.clipsToBounds = YES;
        imageView.frame = CGRectMake(masterFrame.size.width-67.5, 0, 45, 45);
        
        UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(masterFrame.size.width-67.5, 0, 45, 45)];
        shadowView.backgroundColor = [UIColor whiteColor];
        shadowView.layer.cornerRadius = 22.5;
        shadowView.layer.shadowRadius = 3;
        shadowView.layer.shadowOpacity = 0.6;
        shadowView.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
        shadowView.layer.shadowOffset = CGSizeMake(0, 2);
        
        [optionLabal addSubview:imageView];
        [optionLabal insertSubview:shadowView belowSubview:imageView];
        
    }
    
    // Add the labelOutline
    [labelOutline addSubview:label];
    [optionLabal addSubview:labelOutline];
    
    return optionLabal;
    
}

@end
