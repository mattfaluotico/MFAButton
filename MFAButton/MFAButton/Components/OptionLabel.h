//
//  OptionLabel.h
//  MFAButton
//
//  Created by Matthew Faluotico on 11/11/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionLabel : UIView {
    void (^EventBlock)();
}

@property UIImage *optionImage;
@property NSString *optionText;


- (id) initWithLabelIndex: (NSInteger) index Text: (NSString*) text image: (UIImage *) image andEvent: (void (^)())event;

- (id) initWithView: (UIView *) view andEventBlock: (void (^)())event;

- (void) setEventBlock: (void (^)())event;

@end
