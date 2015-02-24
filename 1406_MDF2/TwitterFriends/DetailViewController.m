//
//  DetailViewController.m
//  TwitterFriends
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize thisFriendDetails;


- (void)viewDidLoad
{
    // Set the friend info
    //NSLog(@"Current Friend Info from Detail View %@", thisFriendDetails.description);
    //NSLog(@"User screenname from Detail %@", thisFriendDetails.userScreenName);
    friendImage.image = thisFriendDetails.userImageBigger;
    friendUsername.text = thisFriendDetails.userScreenName;
    friendDescription.text = thisFriendDetails.userDescription;
    friendPosts.text = thisFriendDetails.userTweetsNum;
    friendsFollowers.text = thisFriendDetails.userFollowersNum;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closeView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
