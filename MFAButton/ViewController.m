//
//  ViewController.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/9/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "ViewController.h"
#import "MFAButton.h"
#import "GENERIC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MFAButton *mfb = [[MFAButton alloc] initAsOptionListButton];
    
    [mfb addOption:[GENERIC genericOptionLabelWithText:@"Option one"
                                          imageForIcon:[UIImage imageNamed:@"moose"]
                                              andEvent:^{
                                                NSLog(@"clicked option one");
                                            }]];
    
    [mfb addOption:[GENERIC genericOptionLabelWithText:@"Option two thousand"
                                          imageForIcon:[UIImage imageNamed:@"moose"]
                                              andEvent:^{
                                                  NSLog(@"clicked option two");
                                              }]];
    
    [mfb addOption:[GENERIC genericOptionLabelWithText:@"Option three"
                                          imageForIcon:[UIImage imageNamed:@"moose"]
                                              andEvent:^{
                                                  NSLog(@"clicked option three");
                                              }]];

    [mfb addOption:[GENERIC genericOptionLabelWithText:@"Option four"
                                          imageForIcon:[UIImage imageNamed:@"moose"]
                                              andEvent:^{
                                                  NSLog(@"clicked option four");
                                              }]];
    
    [mfb addOption:[GENERIC genericOptionLabelWithText:@"Option five"
                                          imageForIcon:[UIImage imageNamed:@"moose"]
                                              andEvent:^{
                                                  NSLog(@"clicked option five");
                                              }]];
    
    

    [mfb setFrontButton:[GENERIC genericFrontButtonWithDefaultText:@"+" activeText:@"active" andColor:[UIColor brownColor]] WithPosition:MFAButtonPositionCenter];
    
    [mfb setButtonEvent:^{
        [mfb clearListFromView];
    }];

    [self.view addSubview:mfb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
