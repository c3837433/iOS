//
//  AppDelegate.m
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // PARSE SOCIAL
    [Parse setApplicationId:@"pkzn46AzvVVZErQnOtlRw6WBNaSNS9UjcvB2awt8"
                  clientKey:@"7etJgFc29sl8qNK388cDDYEhdTzNerGkR62jOoMw"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // SET FACEBOOK OAUTH
    [PFFacebookUtils initializeFacebook];
    
    // Set default ACLs for parse so users can read data
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    // Override point for customization after application launch.
    
    // Change nav bar tint color
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    return YES;
}

// FACEBOOK OAUTH
// Facebook Test User Log In
// email:       sherlock_cpfkskw_holmes@tfbnw.net
// password:    sherlock
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Facebook callback
   [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
