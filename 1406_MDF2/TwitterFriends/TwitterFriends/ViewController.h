//
//  ViewController.h
//  TwitterFriends
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import "CustomFriendObject.h"
#import "DetailViewController.h"


@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    IBOutlet UICollectionView* friendsView;
    NSArray* twitterAccounts;
    NSInteger selectedAccountIndex;
    ACAccount *currentAccount;
    NSMutableArray* friendObjects;
    CustomFriendObject* currentFriend;
    NSInteger selectedIndex;
}

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;


-(void)refreshFriendList;
@end
