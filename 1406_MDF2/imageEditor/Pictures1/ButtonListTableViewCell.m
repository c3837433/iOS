//
//  ButtonListTableViewCell.m
//  Pictures
//
//  Created by Angela Smith on 6/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ButtonListTableViewCell.h"

@implementation ButtonListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
