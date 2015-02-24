//
//  TweetListTableViewCell.h
//  TwitterProject
//
//  Created by Angela Smith on 6/2/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetListTableViewCell : UITableViewCell
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *tweetLineText;
@property (strong, nonatomic) IBOutlet UILabel *tweetLineDate;
@property (strong, nonatomic) IBOutlet UIImageView *tweetImage;

// Refresh the Twitter feed
-(void)refreshTwitterFeed:(NSString*) subjectHeader tweetDate:(NSString*) tweetDate retweetImage:(UIImage*)retweetImage;

@end
