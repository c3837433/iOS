//
//  FriendCollectionViewCell.m
//  TotalTweet
//
//  Created by Angela Smith on 6/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "FriendCollectionViewCell.h"

@implementation FriendCollectionViewCell

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

@end
