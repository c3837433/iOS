//
//  collectionFriendCustomCell.m
//  TwitterFriends
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "collectionFriendCustomCell.h"

@implementation collectionFriendCustomCell
@synthesize friendImage, friendNameLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)refreshCollectionCellWithFriendInfo: (NSString*)friendName friendCellImage:(UIImage*)friendCellImage
{
    friendNameLabel.text = friendName;
    friendImage.image = friendCellImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
