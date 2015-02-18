//
//  SettingsSwitchTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/18/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsLayoutTableViewCell.h"



@interface SettingsLayoutTableViewCell ()

@property (nonatomic, strong) UIView *leftButton;
@property (nonatomic, strong) UIView *rightButton;


@end

@implementation SettingsLayoutTableViewCell
- (IBAction)selectionChanged:(UISegmentedControl *)sender {
    
    if(sender.selectedSegmentIndex == 1)
    {
    
    }
}

- (void)awakeFromNib {
    // Initialization code
    self.segmentedControl.tintColor = [UIColor clearColor];
    
    self.leftButton = [self.segmentedControl.subviews objectAtIndex:1];
    self.leftButton.backgroundColor = [UIColor redColor];
    self.rightButton = [self.segmentedControl.subviews objectAtIndex:0];
    self.rightButton.backgroundColor = [UIColor blueColor];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
