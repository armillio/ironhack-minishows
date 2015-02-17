//
//  MainViewTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/17/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "MainViewTableViewCell.h"

IB_DESIGNABLE

@implementation MainViewTableViewCell

- (void) adjustCellAppearance
{

    self.titleLabel.text = @"Breaking Bad";
    self.descriptionLabel.text = @"Season 3 Episode 6";
    self.behindCountLabel.text = @"5 behind";
    self.contentView.layer.cornerRadius = 20.0f;
    self.contentView.layer.masksToBounds = YES;
    UIImage * newImage =  [UIImage imageNamed:@"breaking_bad"];
    //self.imageView.contentMode = UIView;
    [self.imageView setImage:newImage];
    

}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layoutIfNeeded];
    [self.imageView.layer setCornerRadius:self.imageView.frame.size.height/2];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
