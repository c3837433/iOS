//
//  FriendCollectionViewCell.h
//  TotalTweet
//
//  Created by Angela Smith on 6/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCollectionViewCell : UICollectionViewCell
// Define the properties for the collectionView Cells
@property IBOutlet UILabel* friendNameLabel;
@property IBOutlet UIImageView* friendImage;

// Define the method to set the object properties
-(void)refreshCollectionCellWithFriendInfo: (NSString*)friendName friendCellImage:(UIImage*)friendCellImage;

@end
