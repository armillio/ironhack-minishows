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

@property (assign, nonatomic) CGFloat initialImageConstraintValue;
@property (assign, nonatomic) CGFloat actualImageConstraintValue;

@property (assign, nonatomic) CGFloat scrollCounter;

@property (assign, nonatomic) CGFloat showButtonBarHeight;
@property (assign, nonatomic) CGFloat showImageHeight;

@property (assign, nonatomic) CGFloat statusBarHeight;
@property (assign, nonatomic) CGFloat navigationBarHeight;
@property (assign, nonatomic) CGFloat calculateImagePosition;
@property (assign, nonatomic) CGFloat calculateBarPosition;

@property (assign, nonatomic) CGFloat systemPositionHeight;

@end

static NSString *const generalInfoTitle = @"General Info";
static NSString *const overviewTitle = @"Overview";

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showScrollView.delegate = self;
    
    self.showButtonBarHeight = self.showButtonBar.frame.size.height;
    self.showImageHeight = self.showImage.frame.size.height;
    self.scrollCounter = self.showImageHeight;
    
    self.systemPositionHeight = self.statusBarHeight + self.navigationBarHeight;
    
    self.navigationController.navigationBar.titleTextAttributes = @{ NSFontAttributeName : [UIFont fontWithName:@"Heiti SC" size:18.0],
                                                                     NSForegroundColorAttributeName : [UIColor colorWithRed:113.0/255.0
                                                                                                                  green:113.0/255.0
                                                                                                                   blue:113.0/255.0
                                                                                                                  alpha:1.0]};
    //Change for the real value
    self.title = @"Breaking Bad";

    self.statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    self.calculateImagePosition = self.showImageHeight - self.statusBarHeight - self.navigationBarHeight;
    self.calculateBarPosition = self.showImageHeight - self.showButtonBarHeight - self.statusBarHeight - self.navigationBarHeight;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backButton"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(goBackToMainView)];
    
    // Change when we get what funcionality this window will do
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuButton"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    
    // Dummy data
    self.generalInfoContent = @"Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime. Do you believe that shit? It actually says that in the little book that comes with it: the most popular gun in American crime. Like they're actually proud of that shit.";
    self.overviewContent = @"Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass.";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self makeTheTextViewPretty];
}

-(void) makeTheTextViewPretty
{
    NSMutableAttributedString *grupedShowContent = [[NSMutableAttributedString alloc]
                                                    initWithString: [NSString stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@",
                                                                     generalInfoTitle,
                                                                     self.generalInfoContent,
                                                                     overviewTitle,
                                                                     self.overviewContent]
                                                    attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Heiti SC" size:20],
                                                                  NSForegroundColorAttributeName: [UIColor colorWithRed:113.0/255.0
                                                                                                                  green:113.0/255.0
                                                                                                                   blue:113.0/255.0
                                                                                                                  alpha:1.0]}];
    // Make the title headers Bigger
    [grupedShowContent addAttribute:NSFontAttributeName
                              value:[UIFont fontWithName:@"Heiti SC" size:28]
                              range:[self getRangeFromTitleWithString:generalInfoTitle]];
    [grupedShowContent addAttribute:NSFontAttributeName
                              value:[UIFont fontWithName:@"Heiti SC" size:28]
                              range:[self getRangeFromTitleWithString:overviewTitle]];
    
    self.showContent.attributedText = grupedShowContent;
}

-(NSRange) getRangeFromTitleWithString:(NSString *)searchString
{
    NSRange returnRange = [[NSString stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@",
                                      generalInfoTitle,self.generalInfoContent,
                                      overviewTitle, self.overviewContent]
                                     rangeOfString:searchString
                                     options:NSBackwardsSearch];

    return returnRange;
}

-(void) goBackToMainView
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{    
    if(self.showScrollView.contentOffset.y > self.calculateBarPosition)
    {
        [self.showButtonBarConstrait setConstant:self.showScrollView.contentOffset.y - self.calculateImagePosition];
    }else
    {
        [self.showButtonBarConstrait setConstant: -self.showButtonBarHeight];
    }
    
    if(self.showScrollView.contentOffset.y <= -(self.systemPositionHeight))
    {
        [self.showImageConstraint setConstant:self.scrollCounter];
        self.scrollCounter++;
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.showImageConstraint setConstant:self.showImageHeight];
        self.scrollCounter = self.showImageHeight;
        [self.view layoutIfNeeded];
    }];
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

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

-(BOOL)shouldAutorotate
{
    return FALSE;
}

@end
