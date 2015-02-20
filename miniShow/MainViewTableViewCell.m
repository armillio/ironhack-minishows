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

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.clipsToBounds = NO;
    self.contentView.layer.cornerRadius = 20.0f;
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.borderWidth = 2.0f;
    self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layoutIfNeeded];
    [self.iv.layer setCornerRadius:self.iv.frame.size.width/2];
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
