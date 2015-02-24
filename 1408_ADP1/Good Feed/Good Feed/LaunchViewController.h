//
//  LaunchViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LaunchViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, NSURLConnectionDataDelegate>
{
    // User Name and email
    NSString* facebookUserName;
    NSString* facebookUserEmail;
    // URLRequest data for Facebook image
    NSMutableData* facebookUserProfilePictureData;
    NSUserDefaults* userDefaults;
}

-(void)updateFacebookDataForUser:(PFUser*)user;

@end
