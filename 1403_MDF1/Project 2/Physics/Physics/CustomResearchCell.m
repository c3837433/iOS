//
//  CustomResearchCell.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "CustomResearchCell.h"

@implementation CustomResearchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Call this method every time the research view needs to be updated
-(void)refreshCellWithData:(NSString*) articleTitle
{
    // set the title of the report
    researchTitle.text = articleTitle;
}

@end
