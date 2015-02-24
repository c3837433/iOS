//
//  LogInViewController.m
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "LogInViewController.h"
#import "AppDelegate.h"

@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize hasSeenTour;
- (void)viewDidLoad
{
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorWithHue:0.59 saturation:0.94 brightness:0.97 alpha:1]];
    
    // remove the shadow border from the navbar
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // Create a default so the tour information is not viewed again
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* hasSeen = @"NO";
    [defaults setObject:hasSeen forKey:@"tutorial"];
    // synchronize so the data gets saved
    [defaults synchronize];
    
    // Change the color of the title to white
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [super viewDidLoad];
    // Create a gesture recognizer so that when the user clicks off the uitextfield, it will call the method that will dismiss the keyboard while on this view
    UITapGestureRecognizer *clickOnScreen = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(closeKeyboard)];
    // Call the method
    [self.view addGestureRecognizer:clickOnScreen];
    
	// Do any additional setup after loading the view.
}

// Close the keyboard when the user clicks off the textfields
- (IBAction)onClick:(id)sender {
    
    // Access the delegate to get the URL Request
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    // set the delegate webViewUrl property to the request
    delegate.username = [[NSString alloc] initWithString:usernameField.text];
    
}
-(IBAction)closeTour:(id)sender
{   // this is the close tour button
    tourInfoView.Hidden = YES;
    tourNextButton = Nil;
    
}

-(void)closeKeyboard {
    // when the user clicks on either of the text fields, close the keyboard
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:true];
    return true;
}

- (IBAction)switchViews:(UIStoryboardSegue *)segue {
    // Return back to the login screen
}

-(void)viewWillAppear:(BOOL)animated
{
    // remove text from fields
    usernameField.text = @"";
    passwordField.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *hasToured = [defaults objectForKey:@"tutorial"];
    if ([hasToured isEqualToString:@"YES"]) {
        // hide the tour view
        tourInfoView.hidden = YES;
    }
    
}

@end
