//
//  ViewController.h
//  TwitterPractice
//
//  Created by Angela Smith on 6/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

// 1. Add the accounts and social frameworks to the application
// 2. Add twitter account to the simulator

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView* tweetsTableView;
    IBOutlet UITableView* accountsTableView;
    IBOutlet UILabel* userNameLabel;
    IBOutlet UIButton* chooseAccountButton;
    IBOutlet UILabel* chooseAccountLabel;
    NSMutableArray* tweetObjects;
    NSArray* twitterAccounts;
    NSInteger selectedAccountIndex;
    ACAccount *currentAccount;
}

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;

-(void)refreshTwitterFeed;

-(IBAction)onClick:(UIButton*)button;
@end
