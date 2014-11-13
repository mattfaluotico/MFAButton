//
//  GENERIC.h
//  MFAButton
//
//  Created by Matthew Faluotico on 11/12/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FrontButton.h"
#import "OptionLabel.h"

@interface GENERIC : NSObject

+ (FrontButton *) genericFrontButtonWithDefaultText: (NSString *) defaultText
                                          activeText: (NSString *) activeText
                                               color: (UIColor*) c
                                            andEvent: (void (^)())event;

+ (OptionLabel *) genericOptionLabelWithText: (NSString *) text
                                imageForIcon: (UIImage *) image
                                    andEvent:(void (^)())event;


@end
