//
//  GENERIC.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/12/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "GENERIC.h"
#import "POP/pop.h"

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
    button.backgroundColor = c;
    
    [button setImage:[UIImage imageNamed:@"X.png"] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
//    button.imageView.layer.anchorPoint = button.center;
    
    UIView *shadow = [[UIView alloc] initWithFrame:button.frame];
    
    shadow.backgroundColor = [UIColor whiteColor];
    shadow.layer.cornerRadius = button.frame.size.width / 2;
    shadow.layer.shadowRadius = 3;
    shadow.layer.shadowOpacity = 0.6;
    shadow.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    shadow.layer.shadowOffset = CGSizeMake(0, 2);
    
    UITapGestureRecognizer *buttonTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(spinny:)];
    buttonTap.cancelsTouchesInView = NO;
    [button addGestureRecognizer:buttonTap];
    
    button.tag = 0;
    
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

+ (void) spinny: (UITapGestureRecognizer *) r {
    UIButton *button = (UIButton*)r.view;
    
    POPBasicAnimation *spin = [POPBasicAnimation new];
    spin.property = [POPAnimatableProperty propertyWithName:kPOPLayerRotation];
    
    if (button.tag == 1) {
        spin.toValue = @0;
        spin.fromValue = @(M_PI * -1.25);
        button.tag = 0;
    } else {
        spin.fromValue = @0;
        spin.toValue = @(M_PI * -1.25);
        button.tag = 1;
    }
    
    [button.layer pop_addAnimation:spin forKey:@"spin"];
}

@end
