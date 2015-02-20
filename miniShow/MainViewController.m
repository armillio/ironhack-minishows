//
//  MainViewController.m
//  miniShow
//
//  Created by Jessie Serrino on 17/02/15.
//  Modified by Armando Carmona on 20/02/15
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.

#import "NavigationAnimationController.h"
#import "MainViewController.h"
#import "ShowViewController.h"
#import "SettingsViewController.h"
#import "MainViewTableViewCell.h"

NSString * const kMainShowCellIdentifier = @"MainShowCell";
NSUInteger const kCellHeightPortrait = 90;
NSUInteger const kCellHeightLandscape = 70;
NSUInteger const kCellSpacing = 5;

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) ShowViewController *showViewController;
@property (nonatomic, strong) SettingsViewController *settingsViewController;

@property (strong, nonatomic) NSArray *mainShowsContent;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeTableView];
    [self updateViewAesthetics];
    
    self.navigationController.delegate = self;
    
    self.mainShowsContent = @[
                              @[@"Breaking Bad", @"Season 2 Episode 1", @"5 behind", @"WallpaperWizard"],
                              @[@"Breaking Bad", @"Season 3 Episode 1", @"5 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 4 Episode 2", @"4 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 3", @"5 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 4", @"1 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 5 Episode 5", @"5 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 6", @"2 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 7", @"5 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 8", @"4 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 9", @"5 behind", @"breaking_bad"],
                              @[@"Breaking Bad", @"Season 3 Episode 10", @"5 behind", @"breaking_bad"]
                              ];
  
}

- (void) initializeTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainViewTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MainViewTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void) updateViewAesthetics
{
    // Navigation Bar Items
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsButton"] style:UIBarButtonItemStylePlain target:self action:@selector(openSettings)];
    
    // Title in Navigation Bar
    self.navigationItem.title = @"miniSHOWS";

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void) openSettings
{
    self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
    
    //Present modal view
    [self.navigationController presentViewController:self.settingsViewController
                                            animated:YES
                                          completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.mainShowsContent.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kCellSpacing;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    
    return v;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainViewTableViewCell *cell = (MainViewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainViewTableViewCell class]) forIndexPath:indexPath];
    
    cell.titleLabel.text = self.mainShowsContent[indexPath.row][0];
    cell.descriptionLabel.text = self.mainShowsContent[indexPath.row][1];
    cell.behindCountLabel.text = self.mainShowsContent[indexPath.row][2];
    cell.iv.image = [UIImage imageNamed:self.mainShowsContent[indexPath.row][3]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.view.frame.size.width < 450)
    {
        return kCellHeightPortrait;
    }else{
        return kCellHeightLandscape;
    }
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.showViewController = [[ShowViewController alloc] initWithNibName:@"ShowViewController" bundle:[NSBundle mainBundle]];
    self.showViewController.showImage = self.mainShowsContent[indexPath.row][3];
    self.showViewController.title = self.mainShowsContent[indexPath.row][0];
    [self.navigationController pushViewController:self.showViewController animated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    NavigationAnimationController *animator  = [[NavigationAnimationController alloc] init];
    
    animator.operation = operation;
    
    return animator;
    
    return nil;
}

@end
