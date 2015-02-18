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

@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showScrollView.delegate = self;
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 176
    // 138
    
    // 240
    if(self.showScrollView.contentOffset.y > 138)
    {
        [self.showButtonBarConstrait setConstant:self.showScrollView.contentOffset.y - 176];
    }else
    {
        [self.showButtonBarConstrait setConstant:-38];
    }
    
    if(self.showScrollView.contentOffset.y < -64)
    {
        [self.showImageConstraint setConstant:240 * -(self.showScrollView.contentOffset.y / 120)];
        
        //self.showImage.frame = CGRectMake(self.showImage.frame.origin.x, self.showImage.frame.origin.y, self.showImage.frame.size.width, self.showImage.frame.size.height - (self.showScrollView.contentOffset.y / 128));
        
    }else
    {
        [self.showImageConstraint setConstant:240];
    }
    
    [self.view layoutIfNeeded ];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.view layoutIfNeeded ];

}

@end
