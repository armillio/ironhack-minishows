//
//  ShowViewController.h
//  miniShow
//
//  Created by Armando on 17/02/15.
//  Copyright (c) 2015 Armando Carmona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@property (strong, nonatomic) NSString *generalInfoContent;
@property (strong, nonatomic) NSString *overviewContent;

@end
