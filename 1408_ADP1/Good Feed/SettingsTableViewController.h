//
//  SettingsTableViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SettingsTableViewController : UITableViewController <NSURLConnectionDataDelegate>

{
    NSUserDefaults* userDefaults;
}
@end
