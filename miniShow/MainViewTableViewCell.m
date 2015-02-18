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
    self.imageView.image = [UIImage imageNamed:@"breaking_bad"];
    self.imageView.clipsToBounds = YES;

    //self.imageView.contentMode = UIView;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.contentView.layer.cornerRadius = 20.0f;
    self.contentView.layer.masksToBounds = YES;
    
    
    [self adjustCellAppearance];

    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layoutIfNeeded];
    [self.imageView.layer setCornerRadius:self.imageView.frame.size.width/2];


}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{

}

- (void)setSelected:(BOOL)selected
{
    
}


@end
