//
//  ShowViewController.m
//  miniShow
//
//  Created by Armando on 17/02/15.
//  Copyright (c) 2015 Armando Carmona. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *showScrollView;
@property (weak, nonatomic) IBOutlet UIView *showButtonBar;
@property (weak, nonatomic) IBOutlet UITextView *showContent;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showButtonBarConstrait;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showImageConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showImageWidthConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@property (assign, nonatomic) CGFloat initialImageConstraintValue;
@property (assign, nonatomic) CGFloat actualImageConstraintValue;

@property (assign, nonatomic) CGFloat scrollCounter;

@property (assign, nonatomic) CGFloat showButtonBarHeight;
@property (assign, nonatomic) CGFloat showImageHeight;
@property (assign, nonatomic) CGFloat statusPlusnavigation;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showScrollView.delegate = self;
    
    self.showButtonBarHeight = self.showButtonBar.frame.size.height;
    self.showImageHeight = self.showImage.frame.size.height;
    self.scrollCounter = self.showImageHeight;
    
    self.navigationController.navigationBar.titleTextAttributes = @{ NSFontAttributeName : [UIFont fontWithName:@"Heiti SC" size:18.0],
                                                                     NSStrokeColorAttributeName : [UIColor colorWithRed:113.0 green:113.0 blue:113.0 alpha:1.0]};
    //Change for the real value
    self.title = @"Breaking Bad";

    self.statusPlusnavigation = self.navigationController.navigationBar.frame.size.height +  [UIApplication sharedApplication].statusBarFrame.size.height;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backButton"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(goBackToMainView)];
    
    // Change when we get what funcionality this window will do
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuButton"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
}

-(void) goBackToMainView
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat calculateImagePosition = self.showImageHeight - self.statusPlusnavigation;
    CGFloat calculateBarPosition = self.showImageHeight - self.showButtonBarHeight - self.statusPlusnavigation;
    
    if(self.showScrollView.contentOffset.y > calculateBarPosition)
    {
        [self.showButtonBarConstrait setConstant:self.showScrollView.contentOffset.y - calculateImagePosition];
    }else
    {
        [self.showButtonBarConstrait setConstant: -self.showButtonBarHeight];
    }
    
    if(self.showScrollView.contentOffset.y <= -self.statusPlusnavigation)
    {
        [self.showImageConstraint setConstant:self.scrollCounter];
        self.scrollCounter++;
        
        if(self.showScrollView.contentOffset.y <= -self.statusPlusnavigation-1)
        {
            [self.view layoutIfNeeded];
        }
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self.showImageConstraint setConstant:self.showImageHeight];
    self.scrollCounter = self.showImageHeight;
    [self.view layoutIfNeeded];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end
