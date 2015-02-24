//
//  TweetDetailViewController.h
//  TwitterPractice
//
//  Created by Angela Smith on 6/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTweetsObject.h"

@interface TweetDetailViewController : UIViewController
{
    IBOutlet UILabel* userName;
    IBOutlet UITextView* tweetText;
    IBOutlet UILabel* tweetDate;
    IBOutlet UIImageView* retweetImage;
    
}
@property (nonatomic, strong) CustomTweetsObject* currentTweet;
@end
