//
//  MFAButton.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "MFAButton.h"
#import "OptionLabel.h"

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
    [self.frontButton addTarget:self action:@selector(performEvent) forControlEvents:UIControlEventTouchUpInside];
    return self;
};

- (void) setEvent: (void (^)())event {
    EventBlock = event;
}

- (void) performEvent {
    NSLog(@"presssed");
    [self launchTestList];
}

- (void) launchTestList {
    
    // Sets the background view
    self.backgroundView = [[BackgroundView alloc] init];
    self.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
    [self insertSubview:self.backgroundView belowSubview:self.frontButton];
    
    // Sets the list elements
    CGRect screen = [[UIScreen mainScreen] bounds];
    OptionLabel *one = [[OptionLabel alloc] initWithLabelIndex:1 Text:@"Really fucking big Cactus" image:nil andEvent:nil];
    OptionLabel *main = [[OptionLabel alloc] initWithLabelIndex:0 Text:@"Really fucking big Cactus" image:nil andEvent:nil];
    OptionLabel *two = [[OptionLabel alloc] initWithLabelIndex:2 Text:@"Bigger Cactus" image:nil andEvent:^{
        NSLog(@"hello!");
    }];
    
    [self.backgroundView addSubview:one];
    [self.backgroundView addSubview:main];
    [self.backgroundView addSubview:two];
    
}

- (void) asSelector: (id) class performs:(SEL) sel {
    [class performSelector:sel withObject:nil];
}

# pragma Mark - Set Parameters

- (void) setButtonPosition:(MFAButtonPosition *)ButtonPosition {
    
}

# pragma mark Handle hits to view

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self)
        return nil;
    else
        return hitView;
}

#pragma mark - update

- (void) newInit {
    
}

- (void) setBackgrounViewParams {
    
}

- (void) setFrontButtonViewParams {
    
}

@end
