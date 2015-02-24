//
//  FeedViewController.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


{
    IBOutlet UITableView* tweetsTableView;
    IBOutlet UILabel* userNameLabel;
    IBOutlet UIButton* chooseAccountButton;
    NSMutableArray* tweetObjects;

}

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;

-(void)refreshTwitterFeed;
-(IBAction)onClick:(UIButton*)button;
@end