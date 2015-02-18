//
//  SettingsColorTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/18/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsColorTableViewCell.h"


IB_DESIGNABLE

@implementation SettingsColorTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    UIView * greenView= [self.segmentedControl.subviews objectAtIndex:0];
    
    
    UIView * yellowView= [self.segmentedControl.subviews objectAtIndex:1];
    
    UIImageView *yellowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yellowColorSetting"]];
    
    UIView * purpleView= [self.segmentedControl.subviews objectAtIndex:2];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
