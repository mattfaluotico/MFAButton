//
//  OptionLabel.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/11/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "OptionLabel.h"

CGFloat labelHeight = 27;
CGFloat frontButtonHeight = 50;
CGFloat imageHeight = 45;
CGFloat marginLR = 10;
CGFloat marginTB = 30;
CGFloat labelPadding = 5;

@implementation OptionLabel

- (id) initWithLabelIndex: (NSInteger) index
                     Text: (NSString*) text
                   image: (UIImage *) image
                andEvent: (void (^)())event {
    
    
    // Init the stuff...
    CGRect frame = [OptionLabel indexToPoint:index text:text];
    
    CGRect masterFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    masterFrame.size.height = 45;
    masterFrame.size.width+= 45 + 10;
    masterFrame.origin.y-=9;
    
    // Label Outline
    UIView *labelOutline = [[UIView alloc] initWithFrame:CGRectMake(0, 9, frame.size.width, frame.size.height)];
    
    self = [super initWithFrame: masterFrame];
    labelOutline.backgroundColor = [UIColor whiteColor];
    labelOutline.layer.cornerRadius = 5;
    self.optionText = text;
    self.optionImage = image;
    EventBlock = event;
    
    // Set Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.text = text;
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performEvent)];
    [self addGestureRecognizer:labelTap];
    
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
        imageView.frame = CGRectMake(frame.size.width + 12.5, 0, 45, 45);
        
        UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width + 12.5, 0, 45, 45)];
        shadowView.backgroundColor = [UIColor whiteColor];
        shadowView.layer.cornerRadius = 22.5;
        shadowView.layer.shadowRadius = 3;
        shadowView.layer.shadowOpacity = 0.6;
        shadowView.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
        shadowView.layer.shadowOffset = CGSizeMake(0, 2);
    
        [self addSubview:imageView];
        [self insertSubview:shadowView belowSubview:imageView];
    }
    
    // Add the labelOutline
    [labelOutline addSubview:label];
    [self addSubview:labelOutline];
    
    return self;
}


// Performs the event aligned with the OptionLabel
- (void) performEvent {
    if (EventBlock) {
        EventBlock();
    }
}

// Gets the origin based on the label size and the index in the list.
+ (CGRect) indexToPoint: (NSInteger) index text: (NSString *) text {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGSize textSize = [text sizeWithAttributes:
                       @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    
    CGSize labelSize = CGSizeMake(textSize.width + (2 * labelPadding), labelHeight);
    
    CGFloat y = 10 + frontButtonHeight + marginLR + (index * (marginTB + labelHeight));
    
    CGFloat x = frontButtonHeight + (2 * marginLR) + (2 * labelPadding) + labelSize.width;
    y = screen.size.height - y;
    x = screen.size.width - x;
    
    if (index == 0) {
        y = screen.size.height - 10 - frontButtonHeight;
    }
    
    return CGRectMake(x, y, labelSize.width, labelSize.height);
}

// TODO: Shrink OptionLabel on Touch
// TODO: Fix spacing


@end
