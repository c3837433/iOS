//
//  CustomPhysicsOptionCell.m
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "CustomPhysicsOptionCell.h"

@implementation CustomPhysicsOptionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

// Call this method every time the view needs to be updated
-(void)refreshCellWithData:(NSString*) subjectHeader subjectSubtitle:(NSString*) subjectSubtitle subjectImage:(UIImage*)subjectImage
{
    // set the passed in arguments to the outlets
    cellTitle.text = subjectHeader;
    cellDescription.text = subjectSubtitle;
    cellImage.image = subjectImage;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
