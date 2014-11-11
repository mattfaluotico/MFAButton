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
    CGRect frame = [OptionLabel indexToPoint:index text:text];
    self = [super initWithFrame: frame];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5;
    self.optionText = text;
    self.optionImage = image;
    EventBlock = event;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.text = text;
    
    [self addSubview:label];
    return self;
}


+ (CGRect) indexToPoint: (NSInteger) index text: (NSString *) text {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGSize textSize = [text sizeWithAttributes:
                       @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    
    CGSize labelSize = CGSizeMake(textSize.width + (2 * labelPadding), labelHeight);
    
    CGFloat y = 10 + frontButtonHeight + marginLR + (index * (marginTB + labelHeight));
    
    CGFloat x = frontButtonHeight + (2 * marginLR) + (2 * labelPadding) + labelSize.width;
    y = screen.size.height - y;
    x = screen.size.width - x;
    
    return CGRectMake(x, y, labelSize.width, labelSize.height);
}



@end
