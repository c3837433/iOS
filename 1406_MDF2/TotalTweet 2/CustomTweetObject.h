//
//  CustomTweetObject.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTweetObject : NSObject
{
    NSString* tweetDate;
    NSString* tweetText;
    UIImage* tweetRetweet;
    NSString* userScreenName;
    NSString* userProfilePicUrl;
    NSString* userDescription;
    NSString* userMadePosts;
    NSString* userFollowers;
    NSString* userFollowing;
}
// Properties for custom init
@property (nonatomic, readonly) NSString* tweetDate;
@property (nonatomic, readonly) NSString* tweetText;
@property (nonatomic, readonly) UIImage* tweetRetweet;
@property (nonatomic, readonly) NSString* userScreenName;
@property (nonatomic, readonly) NSString* userProfilePicUrl;
@property (nonatomic, readonly) NSString* userDescription;
@property (nonatomic, readonly) NSString* userMadePosts;
@property (nonatomic, readonly) NSString* userFollowers;
@property (nonatomic, readonly) NSString* userFollowing;

// Create a custom init method that will create the objects
-(id)initTweetObject:(NSString*)screenName userDesc:(NSString*)userDesc userPicUrl:(NSString*)userPicUrl date:(NSString*)date text:(NSString*)text wasRetweeted:(UIImage*)wasRetweeted postsMade:(NSString*)postsMade followers:(NSString*)followers following:(NSString*)following;

@end
