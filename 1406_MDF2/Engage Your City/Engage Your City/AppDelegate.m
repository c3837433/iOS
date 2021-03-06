//
//  AppDelegate.m
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"3ifWZJRVr3Gv7SIvM1KCseAt8c0FPAKY0sPH6x2j"
                  clientKey:@"v8Ne000q83DP8xnae5YoE4aSBM5LjsFeKr1sLfs9"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // ****************************************************************************
    // Fill in with your Parse and Twitter credentials. Don't forget to add your
    // Facebook id in Info.plist:
    // ****************************************************************************
    
    
    // SET FACEBOOK AND TWITTER OAUTH
    [PFFacebookUtils initializeFacebook];
    [PFTwitterUtils initializeWithConsumerKey:@"OjE3bRLWdISaAlcPbGWdFYmtZ" consumerSecret:@"RIiqMG8Lqc35iqlatY9NQiy4mViUZDKbqKxPb96VTTHAPH7LDt"];
    
    // Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    // Override point for customization after application launch.
    return YES;
}

// FACEBOOK OAUTH
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
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

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
