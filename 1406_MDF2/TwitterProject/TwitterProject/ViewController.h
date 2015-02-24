//
//  ViewController.h
//  TwitterProject
//
//  Created by Angela Smith on 6/2/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
// Import the accounts framework
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    //IBOutlet UITableView* accountsTableView;
    IBOutlet UITableView* tweetsTableView;
    NSArray* twitterAccounts;
    //NSInteger selectedAccount;
    ACAccount *currentAccount;
    //IBOutlet UILabel* selectedAccountLabel;
    NSMutableArray* tweetObjects;
    //IBOutlet UIView* selectAccountsView;
}
-(void)refreshTwitter;

@end
