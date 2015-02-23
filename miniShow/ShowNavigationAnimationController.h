//
//  ShowNavigationAnimationController.h
//  miniShow
//
//  Created by Armando on 23/02/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShowNavigationAnimationController : NSObject  <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end