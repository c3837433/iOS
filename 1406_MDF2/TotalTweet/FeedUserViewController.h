//
//  FeedUserViewController.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTweetObject.h"

@interface FeedUserViewController : UIViewController
{
    IBOutlet UILabel* userScreenName;
    IBOutlet UITextView* userDescription;
    IBOutlet UIImageView* userPic;
    IBOutlet UILabel* userPostNum;
    IBOutlet UILabel* userFollowers;
    IBOutlet UILabel* userFollowing;
}
@property (nonatomic, strong) CustomTweetObject* currentUserInfo;

@end
