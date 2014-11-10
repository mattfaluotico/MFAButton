//
//  MFAButton.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "MFAButton.h"

@interface MFAButton() {
    void (^EventBlock)();
}

@property FrontButton *frontButton;
@property BackgroundView *backgroundView;



@end

@implementation MFAButton

- (id) initWithSingleActionButton {
    return self;
};

- (id) initWithActionListButton {
    self = [super init];
    self.backgroundView = [[BackgroundView alloc] init];
    self.frontButton    = [[FrontButton alloc] init];
    [self addSubview:self.backgroundView];
    [self addSubview:self.frontButton];
    return self;
};

- (void) setEvent: (void (^)())event {
    EventBlock = event;
    [self.frontButton removeTarget:nil
                            action:NULL
                  forControlEvents:UIControlEventAllEvents];
    
    [self.frontButton
     addTarget:self
     action:@selector(performEvent)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void) performEvent {
    EventBlock();
}

@end
