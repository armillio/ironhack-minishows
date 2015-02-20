//
//  NavigationAnimationController.m
//  miniShow
//
//  Created by Armando on 20/02/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "NavigationAnimationController.h"
#import "MainViewController.h"
#import "ShowViewController.h"

static CGFloat const totalDuration = 1.0;

@implementation NavigationAnimationController

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return totalDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if(self.operation == UINavigationControllerOperationPush)
    {
        [self presentAnimationWithTransitionContext:transitionContext];
        return;
    }
    
    [self dissmissAnimationWithTransitionContext:transitionContext];
}

-(void) presentAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contextView = [transitionContext containerView];
    [contextView addSubview:fromViewController.view];
    [contextView addSubview:toViewController.view];
    
    CGFloat sizeToMove = toViewController.view.frame.size.width * 3;
    
    toViewController.view.center = CGPointMake(toViewController.view.center.x + sizeToMove,
                                               toViewController.view.center.y);
    [UIView animateWithDuration:totalDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         //fromViewController.navigationController.view.transform  = CGAffineTransformMakeScale(0.5, 0.5);
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:totalDuration/2
                                               delay:0.0
                              usingSpringWithDamping:0.8
                               initialSpringVelocity:0.1
                                             options:0
                                          animations:^{
                                              toViewController.view.center = CGPointMake(toViewController.view.center.x - sizeToMove,
                                                                                         toViewController.view.center.y);
                                          }
                                          completion:^(BOOL finished) {
                                              [transitionContext completeTransition:YES];
                                              fromViewController.view.transform = CGAffineTransformIdentity;
                                          }];
                     }];
}

-(void) dissmissAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    // Do everything backwards
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contextView = [transitionContext containerView];
    [contextView addSubview:toViewController.view];
    [contextView addSubview:fromViewController.view];
    
    toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    CGFloat sizeToMove = fromViewController.view.frame.size.width * 3;
    
    [UIView animateWithDuration:totalDuration/2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         fromViewController.view.center = CGPointMake(fromViewController.view.center.x - sizeToMove,
                                                                      fromViewController.view.center.y);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:totalDuration/2
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              toViewController.view.transform = CGAffineTransformIdentity;
                                          } completion:^(BOOL finished) {
                                              [transitionContext completeTransition:YES];
                                              
                                          }];
                     }];
}


@end
