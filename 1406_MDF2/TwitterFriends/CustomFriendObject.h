//
//  CustomFriendObject.h
//  TwitterFriends
//
//  Created by Angela Smith on 6/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomFriendObject : NSObject
{
    UIImage* userImageNormal;
    NSString* userScreenName;
    UIImage* userImageBigger;
    NSString* userDescription;
    NSString* userFollowersNum;
    NSString* userTweetsNum;
    
}
//
@property (nonatomic, readonly) UIImage* userImageNormal;
@property (nonatomic, readonly) UIImage* userImageBigger;
@property (nonatomic, readonly) NSString* userScreenName;
@property (nonatomic, readonly) NSString* userDescription;
@property (nonatomic, readonly) NSString* userFollowersNum;
@property (nonatomic, readonly) NSString* userTweetsNum;

-(id)initWithFriendInfo:(NSString*)screenName image:(UIImage*)image imageBigger:(UIImage*)imageBigger description:(NSString*)description followers:(NSString*)followers tweets:(NSString*)tweets;
@end
