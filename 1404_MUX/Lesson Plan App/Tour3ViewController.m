//
//  Tour3ViewController.m
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "Tour3ViewController.h"

@interface Tour3ViewController ()

@end

@implementation Tour3ViewController

- (IBAction)onClick:(UIStoryboardSegue *)segue {
    // Return to Log In Screen
}
- (void)viewDidLoad
{
    // Create a default so the tour information is not viewed again
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* hasSeen = @"YES";
    [defaults setObject:hasSeen forKey:@"tutorial"];
    // synchronize so the data gets saved
    [defaults synchronize];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated
{
    // Restore the navigation bar
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
