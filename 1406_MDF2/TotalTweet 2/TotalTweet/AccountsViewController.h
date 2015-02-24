//
//  AccountsViewController.h
//  TotalTweet
//
//  Created by Angela Smith on 6/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
@interface AccountsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


{
    IBOutlet UITableView* accountsTableView;
    IBOutlet UILabel* loadingSelectLabel;
    NSArray* twitterAccounts;
    NSInteger selectedAccountIndex;
}

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;


@end
