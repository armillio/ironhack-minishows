//
//  layoutButtonView.h
//  miniShow
//
//  Created by Jessie Serrino on 2/18/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsLayoutButtonView : UIView

@property (nonatomic)           BOOL selected;
@property (nonatomic, weak)     UIImage *selectedImage;
@property (nonatomic, weak)     UIImage *notSelectedImage;
@property (nonatomic, strong)   NSString *text;

- (instancetype) initWithText: (NSString *) text  selectedImage: (UIImage *) selectedImage notSelectedImage: (UIImage *) notSelectedImage selected:(BOOL) selected withFrame: (CGRect) frame;


@end
