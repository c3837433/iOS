//
//  MySignUpViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "MySignUpViewController.h"
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import "UIImage+ResizeAdditions.h"

@interface MySignUpViewController ()

@end

@implementation MySignUpViewController
@synthesize signUpButton, emailField, userNameField, password1Field, password2Field, addProfilePicture, cameraLensView, imageThumbnail, imageData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark USER REGISTRATION METHODS
// MILESTONE 1:2
-(IBAction)userStartsRegistering:(UIButton*)button
{
    BOOL haveEmptyFields = [self checkUserInformation];
    // If we don't have empty fields, gather the data to save to the new user
    if (!haveEmptyFields)
    {
        NSLog(@"All the information is good");
        // Create the new user
        PFUser* newUser = [PFUser user];
        // set the default parse info, setting the email for both email and username, make them lowercase for case insensitivity on log in
        newUser.username = [emailField.text lowercaseString];
        newUser.email = [emailField.text lowercaseString];
        newUser.password = password1Field.text;
        // Set the additional field as the user's name
        newUser[@"UserFullName"] = userNameField.text;
        // Create the PFFIle to hold the image data
        PFFile* imageFile = [PFFile fileWithData:imageData];
        newUser[@"ProfilePicture"] = imageFile;
        // This user namually registered, so set the Facebook linkable property to YES
        newUser[@"FBLinkable"] = @YES;
        newUser[@"sharePermission"] = @"NO";
        // Show HUD view as we save this user
        [MBProgressHUD showHUDAddedTo:self.view.superview animated:YES];
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
             if (error)
             {
                 // Check if email has already been registered
                 if (error.code  == 202)
                 {
                     // remove the hud
                     [MBProgressHUD hideHUDForView:self.view.superview animated:YES];
                     // Alert the user
                     [[[UIAlertView alloc] initWithTitle:@"Email was Already Registered" message:@"Choose Forgot Password on the Log In screen if you need to reset it." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                 }
                 // For all other errors
                 else
                 {
                     // remove the hud
                     [MBProgressHUD hideHUDForView:self.view.superview animated:YES];
                     // Alert the user
                     [[[UIAlertView alloc] initWithTitle:@"Sorry" message:@"We had a problem creating your account, please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
                 }
             }
             else if (succeeded)
             {
                 // Save default permission and close both views and return to the launch screen
                 NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
                 [userDefaults setObject:@"NO" forKey:@"sharePermission"];
                 [userDefaults setObject:@"YES" forKey:@"FBLinkable"];
                 [userDefaults synchronize];
                 [MBProgressHUD hideHUDForView:self.view.superview animated:YES];
                 [self.presentingViewController.presentingViewController dismissViewControllerAnimated:NO completion:NULL];
             }
        }];
    }
}

-(IBAction)onCancel:(UIButton*)button
{
    // When the user cancels the screen, remove any data they entered into the fields
    userNameField.text = @"";
    emailField.text = @"";
    password1Field.text = @"";
    password2Field.text = @"";
    imageThumbnail.image = nil;
    [self dismissViewControllerAnimated:true completion:nil];
}

// MILESTONE 1:6 USER ERROR ALERTS FOR REGISTRATION
-(BOOL)checkUserInformation
{
    BOOL emptyFields = NO;
    BOOL displayFieldAlert = NO;
    NSString* password1 = password1Field.text;
    NSString* password2 = password2Field.text;
    // Check to make sure all the fields are valid
    if (imageThumbnail.image == nil)
    {
        // we have no image
        NSLog(@"Image is missing");
        // Alert the user there was a problem logging in
        [[[UIAlertView alloc] initWithTitle:@"Whoops! Forgot the Picture" message:@"Please add a Profile Picture." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        emptyFields = YES;
    }
    // Once we have the image, check the other fields
    else if (imageThumbnail.image != nil)
    {
        // Reset the bool
        emptyFields = NO;
        // Check if the email address is valid with a regular expression
        NSString* emailRegularExpression = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate* emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegularExpression];
        
        // Make an array of textfields
        NSArray* fieldArray = [[NSArray alloc] initWithObjects:userNameField, emailField, password1Field, password2Field, nil];
        // Loop through the array of textfields
        for (UITextField* field in fieldArray)
        {
            // Make sure none of the fields are empty
            if (field.text.length == 0)
            {
                // If they are, return and display the fields alert
                emptyFields = YES;
                displayFieldAlert = YES;
            }
        }
        // If any of the fields were missing, alert user to fill them in
        if (displayFieldAlert)
        {
            emptyFields = YES;
            [[[UIAlertView alloc] initWithTitle:@"Missing Information" message:@"Yes, we really do need all four fields filled in. :)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
        // If the email does not match the expression alert the user
        else if (![emailPredicate evaluateWithObject:emailField.text])
        {
            emptyFields = YES;
            [[[UIAlertView alloc] initWithTitle:@"Invalid Email" message:@"Please provide a valid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
        // Finally, check to make sure both password fields are the same
        else if (![password1 isEqualToString:password2])
        {
            emptyFields = YES;
            [[[UIAlertView alloc] initWithTitle:@"Oh, so close!" message:@"But no, your passwords do not match. Try again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }
    return emptyFields;
}


#pragma mark UITEXTFIELD DEEGATE METHODS
// Listen for when the user clicks off one of the text fields
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Close the keyboard
    [self.view endEditing:YES];
}

// Listen for the the user clicks one of the textfields to see if the view needs to be moved
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //NSLog(@"Text field was entered");
    //NSLog(@"this tag is %ld", (long)textField.tag);
    // See what fields were edited, 0 does not require moving
    if (!textField.tag == 0)
    {
        [self moveView:YES thisField:textField];
    }
}

// See if the view needs to move back
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    // See what fields were edited, 0 does not require moving
    if (!textField.tag == 0)
    {
        [self moveView:NO thisField:textField];
    }
}

// Move the view up so the user can enter into the fields behind the keyboard
- (void) moveView:(BOOL)outOfWay thisField:(UITextField*)thisField
{
    // Create a variable to hold the distance to move the view based on the distance from that view to the keyboard
    int distanceToMove = 0;
    int field = (int)thisField.tag;
    switch (field) {
        case 1:
            distanceToMove = 30;
            break;
        case 2:
            distanceToMove = 80;
            break;
        case 3:
            distanceToMove = 130;
            break;
            
        default:
            break;
    }
    // if the view is suposed to move out of the way, then move it the distance required up, otherwise return down to normal position
    int viewMoves = viewMoves = (outOfWay ? - distanceToMove : distanceToMove);
    //NSLog(@"The view will move %d",viewMoves);
    // Create the annimagion for when the view moves
    [UIView beginAnimations: @"keyboardAnnimagion" context: nil];
    // Use the current position as the starting for the annimation
    [UIView setAnimationBeginsFromCurrentState: YES];
    // Annimagtion timeframe
    [UIView setAnimationDuration: 0.4f];
    // The view should move along the vertical axis only
    self.view.frame = CGRectOffset(self.view.frame, 0, viewMoves);
    // Move view
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Move the user to the next fields when they hit enter
    if(textField == userNameField)
    {
        [emailField becomeFirstResponder];
    } else if (textField == emailField)
    {
        [password1Field becomeFirstResponder];
    }
    else if (textField == emailField)
    {
        [password1Field becomeFirstResponder];
    }
    else if (textField == password1Field)
    {
        [password2Field becomeFirstResponder];
    }
    else if (textField == password2Field)
    {
        // finally remove the keyboard from the view
        [password2Field resignFirstResponder];
    }
    
    return NO;
}


#pragma mark - USER PROFILE PICTURE METHODS
-(IBAction)launchCamera:(UIButton*)button
{
    NSLog(@"User hit camera button");
    pickerVC = [[UIImagePickerController alloc] init];
    if (pickerVC != nil)
    {
        // Use the device camera and allow editing
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerVC.allowsEditing = TRUE;
        // set the delegate and display the picker
        pickerVC.delegate = self;
        // Display the picker
        [self presentViewController:pickerVC animated:YES completion:nil];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", info.description);
    // Get the edited image from the picker so it will not be too big for Parse
    UIImage* dataThumbnail = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (dataThumbnail != nil) {
        // Crop the image corners and make it the right size
        UIImage* resizedImage = [dataThumbnail thumbnailImage:75 transparentBorder:0 cornerRadius:8 interpolationQuality:kCGInterpolationMedium];
        // Create a png thumbnail of this resized image to display in the user registration view
        imageData = UIImagePNGRepresentation(resizedImage);
        NSLog(@"%@", dataThumbnail.description);
        [picker dismissViewControllerAnimated:YES completion:^{
            // Add the image to the imageview and make it the shape of a circle
            imageThumbnail.image = dataThumbnail;
            imageThumbnail.layer.cornerRadius = imageThumbnail.frame.size.height /2;
            imageThumbnail.layer.masksToBounds = YES;
            // Remove the camera picture
            cameraLensView.image = nil;
        }];
        
    }
}

#pragma mark - VIEW APPEARANCE
- (BOOL) shouldAutorotate
{   // Stop the view from rotating when the device is turned
    return NO;
}

// Change status bar to dark text color
- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
