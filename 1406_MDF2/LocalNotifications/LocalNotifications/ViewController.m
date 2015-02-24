//
//  ViewController.m
//  LocalNotifications
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

// 1. // Call into the UIAPplication shared applciation in the AppDelegate.m
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Before you can create a notification, you need to know when that needs to happen
    // This gets the current date and time and runs an alert ten seconds after the application has been run
    NSDate* date = [[NSDate date] dateByAddingTimeInterval:10];
    
    // Create the notification
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    if (notification != nil) {
        // If the object was created, fire it as per the date given
        notification.fireDate = date;
        // Set the time zone for the notification
        notification.timeZone = [NSTimeZone localTimeZone];
        
        // Set the alert text
        notification.alertBody = @"You have been alerted for no reason other than annoying you :)";
        BOOL hasCompleted = YES;
        if (hasCompleted) {
            // Register the notification
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
        // Register the notification
        //[[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
