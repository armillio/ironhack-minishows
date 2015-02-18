//
//  SettingsSwitchTableViewCell.m
//  miniShow
//
//  Created by Jessie Serrino on 2/18/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SettingsLayoutTableViewCell.h"
#import "SettingsLayoutButtonView.h"


typedef enum {
    kLeftButton = 1,
    kRightButton = 0,
} Button;

@interface SettingsLayoutTableViewCell ()

@property (nonatomic, strong) UIImageView *leftButtonImage;
@property (nonatomic, strong) UIImageView *rightButtonImage;
@property (nonatomic, strong) UILabel *leftButtonLabel;
@property (nonatomic, strong) UILabel *rightButtonLabel;


@end

@implementation SettingsLayoutTableViewCell
- (IBAction)selectionChanged:(UISegmentedControl *)sender {
    
    if(sender.selectedSegmentIndex == kLeftButton)
    {
        [self.leftButtonImage setHighlighted:NO];
        [self.rightButtonImage setHighlighted:YES];
    }
    else if(sender.selectedSegmentIndex == kRightButton)
    {
        [self.leftButtonImage setHighlighted:YES];
        [self.rightButtonImage setHighlighted:NO];
    }
}

- (void)awakeFromNib {
    // Initialization code
    self.segmentedControl.tintColor = [UIColor clearColor];
    self.segmentedControl.selectedSegmentIndex = kLeftButton;
    
    UIView *leftView =[self.segmentedControl.subviews objectAtIndex:kLeftButton];
    
    self.leftButtonImage = [self imageViewWithName:@"listLayoutONButton" andName:@"listLayoutOFFButton" andHighlighted:YES];
    self.leftButtonLabel = [[UILabel alloc] initWithFrame:leftView.frame];
    self.leftButtonLabel.text = @"LIST LAYOUT";
    [leftView addSubview:self.leftButtonLabel];
    [leftView addSubview:self.leftButtonImage];

    UIView *rightView =[self.segmentedControl.subviews objectAtIndex:kRightButton];

    self.rightButtonImage = [self imageViewWithName:@"gridLayoutONButton" andName:@"gridLayoutOFFButton" andHighlighted:NO];
    self.rightButtonLabel = [[UILabel alloc] initWithFrame:rightView.frame];
    self.rightButtonLabel.text = @"GRID LAYOUT";
    [rightView addSubview:self.rightButtonLabel];
    [rightView addSubview:self.rightButtonImage];
    
}


- (UIImageView *) imageViewWithName: (NSString *) selectedImageName andName: (NSString *) notSelectedImageName andHighlighted: (BOOL) isSelected
{
    UIImage *selectedImg = [UIImage imageNamed:selectedImageName];

    UIImage *notSelectedImg = [UIImage imageNamed:notSelectedImageName];
    UIImageView *iv = [[UIImageView alloc] initWithImage:notSelectedImg highlightedImage:selectedImg];
    [iv setHighlighted:isSelected];
    
    return iv;
}

- (UIView *) viewWithText:(NSString *) string withIcon: (UIImage *) icon andFrame: (CGRect) frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    return view;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
