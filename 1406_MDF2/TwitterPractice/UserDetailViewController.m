//
//  UserDetailViewController.m
//  TwitterPractice
//
//  Created by Angela Smith on 6/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "UserDetailViewController.h"

@interface UserDetailViewController ()

@end

@implementation UserDetailViewController
@synthesize currentUserInfo;

- (void)viewDidLoad
{
    NSLog(@"Current User Info: %@", currentUserInfo.description);
    userScreenName.text = currentUserInfo.userScreenName;
    userDescription.text = currentUserInfo.userDescription;
    // POST INFO
    userPostNum.text = currentUserInfo.userMadePosts;
    userFollowing.text = currentUserInfo.userFollowing;
    userFollowers.text = currentUserInfo.userFollowers;
    
    // IMAGE
    // Build the NSURL from the string
    NSURL* imageUrl = [NSURL URLWithString:
                  currentUserInfo.userProfilePicUrl];
    NSLog(@"The url is %@", imageUrl);
    // Create a data object to hold the image and display it in the imageView
    userPic.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:imageUrl]];
  
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
