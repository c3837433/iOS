//
//  SettingsViewController.m
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    // Change the color of the title to white
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // Access the delegate to get the URL Request
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    // Get the username from the object
    usernameLabel.text = delegate.username;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)onClick:(UIStoryboardSegue *)segue {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
