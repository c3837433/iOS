//
//  FriendDetailViewController.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomFriendInfoObject.h"
@interface FriendDetailViewController : UIViewController
{
    IBOutlet UILabel* friendUsername;
    IBOutlet UIImageView* friendImage;
    IBOutlet UILabel* friendsFollowers;
    IBOutlet UILabel* friendDescription;
    IBOutlet UILabel* friendPosts;
}
@property CustomFriendInfoObject* thisFriendDetails;

@end
