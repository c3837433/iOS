//
//  SelectAccountViewController.h
//  TwitterPractice
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface SelectAccountViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    //IBOutlet UITableView* tweetsTableView;
    IBOutlet UITableView* accountsTableView;
    //IBOutlet UILabel* userNameLabel;
    //IBOutlet UIButton* chooseAccountButton;
    //IBOutlet UILabel* chooseAccountLabel;
    NSMutableArray* tweetObjects;
    NSArray* twitterAccounts;
    NSInteger selectedAccountIndex;
    ACAccount *currentAccount;
}

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end
