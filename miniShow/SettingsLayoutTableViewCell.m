//
//  SettingsLayoutTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/20/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsLayoutTableViewCell.h"

static NSInteger const kListLayout = 0;
static NSInteger const kGridLayout = 1;


@interface SettingsLayoutTableViewCell()
@property (strong, nonatomic) IBOutlet UIButton *listLayoutButton;
@property (strong, nonatomic) IBOutlet UIButton *gridLayoutButton;

@end

@implementation SettingsLayoutTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
- (IBAction)buttonPressed:(UIButton *)button {
    
    self.listLayoutButton.selected = (button.tag == kListLayout);
    self.gridLayoutButton.selected = !self.listLayoutButton.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
