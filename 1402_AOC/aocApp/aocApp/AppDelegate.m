//
//  AppDelegate.m
//  aocApp
//
//  Created by Angela Smith on 2/3/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
 /*
    NSLog(@"hello");
    int temp = 42;
    NSLog(@"temp=%d", temp);
    int numTires = 4;
    NSLog(@"The temp is %d degrees, and there are %d tires.", temp, numTires);
    
    
    float celcius = 37.5f;
    NSLog(@"Number of degrees celcius is %.1f", celcius);
  */
    // LOGICAL OPERATORS
    /*
    == equals to
     != not equal
     < Less than
     > greater than
     >= greater than or equal to
     && and
     || or
     */
   /* int temperature = 0;
    if (temperature != 0)
    {
        NSLog(@"The temperature is not equal");
    }
    else {
        NSLog(@"The temp equals 0");
    };
    
    
    int numberTires = 3;
    if (numberTires == 4) {
        NSLog(@"This is a car.");
    }
    else if (numberTires == 2){
        NSLog(@"This is a motercycle");
    }
    else {
        NSLog(@"I have not idea what type of vehicle this is.");
    }
    
    */
    
    //LOOPS
    
/*  For Loop
    
    for (<#initialization#>; <#condition#>; <#increment#>) {
        <#statements#>
    }
    for (int x=0; x<10; x++)
    {
        NSLog(@"Hello loop number %d", x);
    }
    // FOR IN REVERSE
    for (int y =10; y>=0; y--)
    {
        NSLog(@"Y is now in %d place.", y);
    }
    

    // For loop with break
    for (int count=0; count < 100; count++)
    {
        NSLog(@"count is now at %d", count);
        if (count == 55) {
            break;
        }
    }
*/
    // WHILE LOOPS
    int number = 0;
    
    while (number > 10) {
        // Print out the count value
        NSLog(@"Curent number is %d\n", number);
        // Increase number
        number++;
    }
    // DO WHILE LOOP (makes sure loop runs at least one time
    do {
        // Print out the count value
        NSLog(@"Curent number is %d\n", number);
        // Increase number
        number++;
    } while (number > 10);
    

    
    
    return YES;
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
