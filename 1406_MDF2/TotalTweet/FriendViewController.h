//
//  FriendViewController.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import "CustomFriendInfoObject.h"

@interface FriendViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    IBOutlet UICollectionView* friendsView;
    NSMutableArray* friendObjects;
    CustomFriendInfoObject* currentFriend;
    NSInteger selectedIndex;
}

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingIndicator;


@end
