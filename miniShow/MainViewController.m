//
//  MainViewController.m
//  miniShow
//
//  Created by Jessie Serrino on 17/02/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import "MainViewController.h"
#import "ShowViewController.h"
#import "SettingsViewController.h"
#import "MainViewTableViewCell.h"

NSString * const kMainShowCellIdentifier = @"MainShowCell";
NSUInteger const kCellHeightPortrait = 90;
NSUInteger const kCellHeightLandscape = 70;
NSUInteger const kCellSpacing = 5;



@interface MainViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) ShowViewController *showViewController;
@property (nonatomic, strong) SettingsViewController *settingsViewController;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeTableView];
    [self updateViewAesthetics];
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(openShowView)];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settingsButton"] style:UIBarButtonItemStylePlain target:self action:@selector(openSettings)];
    
    // Title in Navigation Bar
    self.navigationItem.title = @"miniSHOWS";

    
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
}

- (void) openSettings
{
    self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController: self.settingsViewController animated:YES];
}

-(void) openShowView
{
    self.showViewController = [[ShowViewController alloc] initWithNibName:@"ShowViewController" bundle:[NSBundle mainBundle]];
    
    [self.navigationController pushViewController:self.showViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainViewTableViewCell *cell = (MainViewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MainViewTableViewCell class]) forIndexPath:indexPath];
    
    [cell adjustCellAppearance];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.view.frame.size.width < 450)
        return kCellHeightPortrait;
    else
        return kCellHeightLandscape;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self openShowView];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
