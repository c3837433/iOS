//
//  FeedDetailViewController.m
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "FeedDetailViewController.h"

@interface FeedDetailViewController ()

@end

@implementation FeedDetailViewController
@synthesize currentTweet;


- (void)viewDidLoad
{
    tweetDate.text = currentTweet.tweetDate;
    tweetText.text = currentTweet.tweetText;
    userName.text = currentTweet.userScreenName;
    retweetImage.image = currentTweet.tweetRetweet;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
