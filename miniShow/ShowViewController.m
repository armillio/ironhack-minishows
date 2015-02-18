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
                                                                     NSForegroundColorAttributeName : [UIColor colorWithRed:113.0/255.0
                                                                                                                  green:113.0/255.0
                                                                                                                   blue:113.0/255.0
                                                                                                                  alpha:1.0]};
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *generalInfoTitle = @"General Info";
    NSString *generalInfoContent = @"Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.";
    NSString *overviewTitle = @"Overview";
    NSString *overviewContent = @"Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass.";
    
    NSRange generalInfoTitleRange = [[NSString stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@",
                                      generalInfoTitle,generalInfoContent,
                                      overviewTitle, overviewContent]
                                     rangeOfString:generalInfoTitle
                                     options:NSBackwardsSearch];
    
    NSRange overviewTitleRange = [[NSString stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@",
                                   generalInfoTitle,generalInfoContent,
                                   overviewTitle, overviewContent]
                                  rangeOfString:overviewTitle
                                  options:NSBackwardsSearch];
    
    NSMutableAttributedString *grupedShowContent = [[NSMutableAttributedString alloc]
                                                    initWithString: [NSString stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@", generalInfoTitle, generalInfoContent, overviewTitle, overviewContent]
                                                    attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Heiti SC" size:20],
                                                                  NSForegroundColorAttributeName: [UIColor colorWithRed:113.0/255.0
                                                                                                                  green:113.0/255.0
                                                                                                                   blue:113.0/255.0
                                                                                                                  alpha:1.0]}];
    
    [grupedShowContent addAttribute:NSFontAttributeName
                              value:[UIFont fontWithName:@"Heiti SC" size:28]
                              range:generalInfoTitleRange];
    [grupedShowContent addAttribute:NSFontAttributeName
                              value:[UIFont fontWithName:@"Heiti SC" size:28]
                              range:overviewTitleRange];
    
    self.showContent.attributedText = grupedShowContent;
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
    [UIView animateWithDuration:0.5 animations:^{
        [self.showImageConstraint setConstant:self.showImageHeight];
        self.scrollCounter = self.showImageHeight;
        [self.view layoutIfNeeded];
    }];
    
}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end
