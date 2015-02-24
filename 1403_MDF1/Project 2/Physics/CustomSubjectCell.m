//
//  CustomSubjectCell.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "CustomSubjectCell.h"

@implementation CustomSubjectCell

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

// Call this method every time the view needs to be updated
-(void)refreshCellWithData:(NSString*) subjectHeader subtitle:(NSString*) subtitle subImage:(UIImage*)subImage
{
    // set the passed in arguments to the outlets
    subjectTitle.text = subjectHeader;
    subjectSubTitle.text = subtitle;
    subjectImage.image = subImage;
}

@end
