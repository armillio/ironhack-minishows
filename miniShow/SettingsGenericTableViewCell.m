//
//  SettingsGenericTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/20/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsGenericTableViewCell.h"

@interface SettingsGenericTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation SettingsGenericTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setLabelText:(NSString *) text
{
    self.label.text = [text uppercaseString];
}
- (IBAction)switchFlipped:(UISwitch *)sender {
}

@end
