//
//  CustomFriendInfoObject.m
//  TotalTweet
//
//  Created by Angela Smith on 6/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "CustomFriendInfoObject.h"

@implementation CustomFriendInfoObject
@synthesize userImageNormal, userScreenName, userImageBigger, userDescription, userFollowersNum, userTweetsNum;

-(id)initWithFriendInfo:(NSString*)screenName image:(UIImage*)image imageBigger:(UIImage*)imageBigger description:(NSString*)description followers:(NSString*)followers tweets:(NSString*)tweets
{
    if ((self = [super init]))
    {
        // Set the passed in variables to the object
        userScreenName = [screenName copy];
        userImageNormal = [image copy];
        userImageBigger = [imageBigger copy];
        userTweetsNum = [tweets copy];
        userFollowersNum = [followers copy];
        userDescription = [description copy];
    }
    return self;
}

@end
