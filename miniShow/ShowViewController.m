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

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showScrollView.delegate = self;
    
    self.scrollCounter = 240;
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(self.showScrollView.contentOffset.y > 138)
    {
        [self.showButtonBarConstrait setConstant:self.showScrollView.contentOffset.y - 176.0];
    }else
    {
        [self.showButtonBarConstrait setConstant: -38];
    }
    
    if(self.showScrollView.contentOffset.y <= -64)
    {
        [self.showImageConstraint setConstant:self.scrollCounter];
        self.scrollCounter++;
        
        if(self.showScrollView.contentOffset.y <= -65)
        {
            [self.view layoutIfNeeded];

        }
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self.showImageConstraint setConstant:240];
    self.scrollCounter = 240;
    [self.view layoutIfNeeded];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end
