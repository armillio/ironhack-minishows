//
//  SettingsColorTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/18/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsColorTableViewCell.h"


static NSInteger const kGreenButton = 0;
static NSInteger const kYellowButton = 1;
static NSInteger const kPurpleButton = 2;



IB_DESIGNABLE

@implementation SettingsColorTableViewCell

- (void)awakeFromNib {
    // Initialization code



}
- (IBAction)button:(UIButton *)sender {
    
    switch(sender.tag)
    {
        case kGreenButton:
            NSLog(@"Green Button");
            break;
        case kYellowButton:
            NSLog(@"Yellow Button");

            break;
        case kPurpleButton:
            NSLog(@"Purple Button");

            break;
        default:
            NSLog(@"Something broke, in SettingsColorTableView");
            break;
            
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
