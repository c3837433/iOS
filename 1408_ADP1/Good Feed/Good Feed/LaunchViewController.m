//
//  LaunchViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "LaunchViewController.h"
#import "LogInViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "DataHelper.h"
#import "MySignUpViewController.h"
#import "MBProgressHUD.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

#pragma mark VIEW NAVIGATION
-(void)viewDidAppear:(BOOL)animated
{
    [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow animated:YES];
    // Check if the user is currently logged in to Parse, if not present the log in screen.
    if (![PFUser currentUser])
    {
        // Present the log in screen
        [self viewLoginScreen];
    }
    else
    {
        // Change to the tab bar controller
        [self changeRootViews];
    }
}

-(void)changeRootViews
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController* tabBarVC = [storyboard instantiateViewControllerWithIdentifier:@"mainTabBarVC"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:tabBarVC];
}

#pragma mark SIGN UP METHODS
-(BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info
{
    // Check to see if the user filled out all the necessary information
    return YES;
}

#pragma mark LOG IN METHODS
// LOAD LOG IN SCREEN
-(void)viewLoginScreen
{
    // Create the log in screen, and set this as the delegate
    LogInViewController* logInVc = [[LogInViewController alloc] init];
    [logInVc setDelegate:self]; 
    
    // Add FACEBOOK Permissions and the fields for them
    logInVc.facebookPermissions = @[@"public_profile", @"email"];
    logInVc.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsFacebook | PFLogInFieldsLogInButton | PFLogInFieldsPasswordForgotten;
    
    // switch to the log in controller
    [self presentViewController:logInVc animated:NO completion:NULL];
}



// MILESTONE 1:3 (Facebook Log In), and 1:6 (manual and facebook email match error)
// WHEN USER LOG IN IS SUCCESSFUL
-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    // Check to see if user is linked with facebook
    BOOL userLinkedWithFacebook = [PFFacebookUtils isLinkedWithUser:user];
    if (userLinkedWithFacebook)
    {
        NSLog(@"The user logged in through Facebook");
        // If the user is linked, make a request for their data
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
         {
             if (!error)
             {
                 // get the result
                 NSLog(@"%@", result);
                 facebookUserName = [result objectForKey:@"name"];
                 facebookUserEmail = [[result objectForKey:@"email"] lowercaseString]; // For case insensitivity
                 NSString* userId = [result objectForKey:@"id"];
                 // get the user's current profile picture
                 NSURL* userProfilePictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",userId]];
                 // Make the request for the image, and set it to expire in 10 days (per Facebook policy)
                 NSURLRequest* profilePicURLRequest = [NSURLRequest requestWithURL:userProfilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
                 // Send the request
                 [NSURLConnection connectionWithRequest:profilePicURLRequest delegate:self];
                 // Use the NSURLConnectionDataDelegate to get the data
                 
                 // Make a query to verify that the user has not tried to connect with a Facebook email address that was user to register manually
                 PFQuery* userQuery = [PFUser query];
                 [userQuery whereKey:@"username" equalTo:[[PFUser currentUser]username]];
                 [userQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
                     // this is a previously registered user
                     if (object)
                     {
                         // Find out if this is a new user by checkinf if permission default was set
                         NSString* permissionString = [object objectForKey:@"sharePermission"];
                         NSString* fbLinkable = [object objectForKey:@"FBLinkable"];
                         NSLog(@"Permission = %@, Facebook linkable = %@", permissionString, fbLinkable);
                         // If not there, this is a new user
                         if (permissionString == nil)
                         {
                             NSLog(@"This is a new user");
                             // User this persons facebook name, email, and id to register them
                             user.email = facebookUserEmail;
                             [user setObject:facebookUserName forKey:@"UserFullName"];
                             [user setObject:userId forKey:@"FacebookId"];
                             [user setObject:@"NO" forKey:@"sharePermission"];
                             [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                 if (error) {
                                     
                                     // If the error code is 203, then we already have this user's email in the database, alert the user they can connect this account in settings (prevents double log ins)
                                     NSLog(@"%ld", (long)error.code);
                                     if (error.code == 203)
                                     {
                                         // this email is already registered
                                         [[[UIAlertView alloc] initWithTitle:@"Wow, you're awesome!"  message:@"Looks like you have registered already. You can sign in with your username then link to Facebook in your Profile." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                                     }
                                     // delete the user that was created as part of Parse's Facebook login
                                     [user deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                         if (succeeded)
                                         {
                                             // Remove Facebook information too
                                             [[FBSession activeSession] closeAndClearTokenInformation];
                                         }
                                     }];
                                 } else if (succeeded)
                                 {
                                     userDefaults = [[NSUserDefaults alloc] init];
                                     [userDefaults setObject:@"NO" forKey:@"sharePermission"];
                                     [userDefaults synchronize];
                                     //NSLog(@"saving %@ for full name, and %@ for email", facebookUserName, facebookUserEmail);
                                     // Finally, close the log in view and present the tab bar
                                     [self dismissViewControllerAnimated:YES completion:NULL];
                                 }
                             }];

                         }
                         else
                         {
                             NSLog(@"This person already registered");
                             // This person already registered, update the user permission default for this device
                             userDefaults = [[NSUserDefaults alloc] init];
                             [userDefaults setObject:permissionString forKey:@"sharePermission"];
                             [userDefaults setObject:fbLinkable forKey:@"FBLinkable"];
                             [userDefaults synchronize];
                             [self dismissViewControllerAnimated:YES completion:NULL];
                         }
                         
                     }
                 }];
             }
             else
                 //Find out what went wrong
             {
                 NSLog(@"%@", error);
             }
         }];
    }
    else if (!userLinkedWithFacebook)
    {   // User logged in manually, find their current permission and fblinkable status
        NSLog(@"The user logged in manually");
        
        PFQuery* userQuery = [PFUser query];
        [userQuery whereKey:@"username" equalTo:[[PFUser currentUser]username]];
        [userQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
            // this is a previously registered user
            if (object)
            {
                // Update the nsuser defaults
                NSString* permissionString = [object objectForKey:@"sharePermission"];
                NSString* fbLinkable = [object objectForKey:@"FbLinkable"];
                NSLog(@"Permission = %@, Facebook linkable = %@", permissionString, fbLinkable);
                userDefaults = [[NSUserDefaults alloc] init];
                [userDefaults setObject:permissionString forKey:@"sharePermission"];
                [userDefaults setObject:fbLinkable forKey:@"FBLinkable"];
                [userDefaults synchronize];

            }
        }];
    
        //switch to main view
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// WHEN USER LOG IN FAILS
-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{
    // Find the error that was sent
    NSDictionary* errorDictionary = [error userInfo];
    // Get the error string
    NSString* errorString = [errorDictionary objectForKey:@"NSLocalizedDescription"];
    NSLog(@"The error is: %@", errorString);
    // Alert the user there was a problem logging in
    [[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Email and Password are not valid. Please try again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

// When the user wants to sync facebook data on the settings view
-(void)updateFacebookDataForUser:(PFUser*)user
{
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error)
     {
         if (!error)
         {
             // get the returned data
             NSLog(@"%@", result);
             facebookUserName = [result objectForKey:@"name"];
             facebookUserEmail = [[result objectForKey:@"email"] lowercaseString]; // For case insensitivity
             NSString* userId = [result objectForKey:@"id"];
             NSString* currentUserId = [user objectForKey:@"FacebookId"];
             // make sure we have the right user
             if ([userId isEqualToString:currentUserId])
             {
                 // Update the remaining data
                 // get the user's current profile picture
                 NSURL* userProfilePictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",userId]];
                 // Make the request for the image with the timeout interval
                 NSURLRequest* profilePicURLRequest = [NSURLRequest requestWithURL:userProfilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
                 // Send the request
                 [NSURLConnection connectionWithRequest:profilePicURLRequest delegate:self];
                 // Use the NSURLConnectionDataDelegate to get the data
                 
                 user.email = facebookUserEmail;
                 [user setObject:facebookUserName forKey:@"UserFullName"];
                 [user setObject:userId forKey:@"FacebookId"];
                 [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                     if (error)
                     {
                         NSLog(@"%ld", (long)error.code);
                     }
                     else if (succeeded)
                     {
                         NSLog(@"User data was updated");
                     }
                 }];

             }
             
         }
         else
         {
             //Find out what went wrong
             NSLog(@"%@", error);
         }
     }];
    
}

#pragma mark - NSURLConnectionDataDelegate
// If the user profile image data came back, begin creating the data object
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    facebookUserProfilePictureData = [[NSMutableData alloc] init];
}

// Add any new data to the object until it is completed
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [facebookUserProfilePictureData appendData:data];
}

// When the data has finished loading, save this to the current user
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Save the image to the current user
    [DataHelper saveFacebookImageData:facebookUserProfilePictureData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
