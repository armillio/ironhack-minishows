//
//  NavigationAnimationController.h
//  miniShow
//
//  Created by Armando on 20/02/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationAnimationController : NSObject  <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end
