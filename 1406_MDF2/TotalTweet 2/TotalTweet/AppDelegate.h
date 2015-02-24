//
//  AppDelegate.h
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ACAccount* currentAccount;
@property (nonatomic) BOOL accountsEnabled;

@end
