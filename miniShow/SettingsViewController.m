//
//  SettingsViewController.m
//  miniShow
//
//  Created by Jessie Serrino on 2/20/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewController.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViewAesthetics];
    [self addTableView];
}

- (void) updateViewAesthetics
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"closeButton"] style:UIBarButtonItemStylePlain target:self action:@selector(goBackToMainView)];
    
    // Title in Navigation Bar
    self.navigationItem.title = @"SETTINGS";
}

- (void) addTableView
{
    [self.view addSubview: [[SettingsTableViewController alloc] init].view];
}


-(void) goBackToMainView
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
