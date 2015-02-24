//
//  FeedDetailViewController.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTweetObject.h"

@interface FeedDetailViewController : UIViewController

{
    IBOutlet UILabel* userName;
    IBOutlet UITextView* tweetText;
    IBOutlet UILabel* tweetDate;
    IBOutlet UIImageView* retweetImage;
    
}
@property (nonatomic, strong) CustomTweetObject* currentTweet;

@end
