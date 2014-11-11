//
//  TableViewController.m
//  MFAButton
//
//  Created by Matthew Faluotico on 11/10/14.
//  Copyright (c) 2014 mf. All rights reserved.
//

#import "TableViewController.h"
#import "MFAButton.h"

@interface TableViewController ()

@property MFAButton *b;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.b = [[MFAButton alloc] initWithActionListButton];
    
    [self.b setEvent:^{
        NSLog(@"touched");
    }];
    
    [self.navigationController.view addSubview:self.b];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGRect frame = self.b.frame;
//    frame.origin.y = scrollView.contentOffset.y;
//    self.b.frame = frame;
//    
//    [self.view bringSubviewToFront:self.b];
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

@end
