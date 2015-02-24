//
//  TwitterCustomObject.h
//  TwitterProject
//
//  Created by Angela Smith on 6/2/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterCustomObject : NSObject
{
}
@property (nonatomic, strong) NSString* tweetText;
@property (nonatomic, strong) NSString* tweetDate;
@property (nonatomic) NSInteger tweetStatus;
@property (nonatomic, strong) UIImage* retweetImageName;

@end
