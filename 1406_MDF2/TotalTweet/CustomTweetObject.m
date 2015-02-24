//
//  CustomTweetObject.m
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "CustomTweetObject.h"

@implementation CustomTweetObject
// Synthesize the properties
@synthesize tweetDate, tweetRetweet, tweetText, userDescription, userProfilePicUrl, userScreenName, userFollowers, userFollowing, userMadePosts;

-(id)initTweetObject:(NSString*)screenName userDesc:(NSString*)userDesc userPicUrl:(NSString*)userPicUrl date:(NSString*)date text:(NSString*)text wasRetweeted:(UIImage*)wasRetweeted postsMade:(NSString*)postsMade followers:(NSString*)followers following:(NSString*)following
{
    // Ititialize this as an object
    if ((self = [super init]))
    {
        // Save the data once it is pulled in
        userScreenName = [screenName copy];
        userDescription = [userDesc copy];
        userProfilePicUrl = [userPicUrl copy];
        tweetDate = [date copy];
        tweetText = [text copy];
        tweetRetweet = [wasRetweeted copy];
        userMadePosts = [postsMade copy];
        userFollowing = [following copy];
        userFollowers = [followers copy];
    }
    return self;
}
@end
