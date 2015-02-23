//
//  layoutButtonView.m
//  miniShow
//
//  Created by Jessie Serrino on 2/18/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsLayoutButtonView.h"

@implementation SettingsLayoutButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype) initWithText: (NSString *) text  selectedImage: (UIImage *) selectedImage notSelectedImage: (UIImage *) notSelectedImage selected:(BOOL) selected withFrame: (CGRect) frame

{
    self = [super initWithFrame:frame];
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    
   // UIImageView *selectedIV = UIImageView
    
    label.text = text;
    label.textColor = [UIColor blackColor];
    [self addSubview:label];
    
    
    self.text = text;
    self.selectedImage = selectedImage;
    self.notSelectedImage = notSelectedImage;
    

    
    return self;
}

- (void) setSelected:(BOOL)selected
{
    self.selected = selected;
    if(selected)
    {
        // Change the image to selectedImage
    }
    else
    {
        // Change the image to notSelectedImage
    }
}

@end
