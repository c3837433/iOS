//
//  UserDetailViewController.h
//  TwitterPractice
//
//  Created by Angela Smith on 6/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTweetsObject.h"

@interface UserDetailViewController : UIViewController
{
    IBOutlet UILabel* userScreenName;
    IBOutlet UITextView* userDescription;
    IBOutlet UIImageView* userPic;
    IBOutlet UILabel* userPostNum;
    IBOutlet UILabel* userFollowers;
    IBOutlet UILabel* userFollowing;
}
@property (nonatomic, strong) CustomTweetsObject* currentUserInfo;

@end
