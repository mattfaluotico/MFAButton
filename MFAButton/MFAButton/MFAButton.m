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
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    self.backgroundView = nil;
    self.frontButton    = [[FrontButton alloc] init];
    [self addSubview:self.backgroundView];
    [self addSubview:self.frontButton];
    self.clipsToBounds = YES;
    
    return self;
};

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id hitView = [super hitTest:point withEvent:event];
    if (hitView == self) return nil;
    else return hitView;
}

- (void) setEvent: (void (^)())event {
    EventBlock = event;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performEvent)];
    [self.frontButton addGestureRecognizer:tap];
}

- (void) performEvent {
    NSLog(@"one");
    EventBlock();
}

- (void) launchList {
    
    // Disable view unactivity
    // add lists to view
    //
    
}

- (void) asSelector: (id) class performs:(SEL) sel {
    [class performSelector:sel withObject:nil];
}

@end
