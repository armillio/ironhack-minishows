//
//  SettingsTableViewController.m
//  miniShow
//
//  Created by Armando on 17/02/15.
//  Copyright (c) 2015 Armando Carmona. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "SettingsColorTableViewCell.h"
#import "SettingsLayoutTableViewCell.h"
#import "SettingsGenericTableViewCell.h"
#import "MainViewTableViewCell.h"

static NSInteger const kCellCount = 7;

typedef enum : NSUInteger {
    LayoutPickType = 0,
    ColorPickCellType,
    GenericCellType
} CellTypes;

@interface SettingsTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *genericCellTitles;
@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self updateViewAesthetics];
    [self initializeTableView];
    [self prepareGenericCells];
}


- (void) initializeTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SettingsLayoutTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SettingsLayoutTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SettingsColorTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SettingsColorTableViewCell class])];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SettingsGenericTableViewCell class]) bundle:nil]
     forCellReuseIdentifier:NSStringFromClass([SettingsGenericTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    CGRect rect = self.view.bounds;
    rect.size.height = 0;
    UIView *rootView = [[[NSBundle mainBundle] loadNibNamed:@"SettingsFooterView" owner:self options:nil] objectAtIndex:0];
    rootView.frame = rect;
    self.tableView.tableFooterView = rootView;


}


- (void) updateViewAesthetics
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"closeButton"] style:UIBarButtonItemStylePlain target:self action:@selector(goBackToMainView)];

    // Title in Navigation Bar
    self.navigationItem.title = @"SETTINGS";
}

- (void) prepareGenericCells
{
    self.genericCellTitles = @[@"Tinted Background",
                               @"Next Episode Sorting",
                               @"Last Episode Sorting",
                               @"Alphabetical Sorting",
                               @"Badge App Icon"];
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
    return kCellCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger cellNumber = [indexPath row];
    UITableViewCell *cell;
    
    if(cellNumber == LayoutPickType)
    {
        // Code for SettingsLayoutTableView
         cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SettingsLayoutTableViewCell class]) forIndexPath:indexPath];
    }
    else if(cellNumber == ColorPickCellType)
    {
        // Code for SettingsColorTableViewCell
        cell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SettingsColorTableViewCell class]) forIndexPath:indexPath];

    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SettingsGenericTableViewCell class]) forIndexPath:indexPath];
        SettingsGenericTableViewCell *c = (SettingsGenericTableViewCell*) cell;
        NSInteger index = cellNumber - 2;
        [c setLabelText:self.genericCellTitles[index]];
        
    }
    
    return cell;
}

-(void) goBackToMainView
{
    [self.navigationController popViewControllerAnimated:YES];
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
