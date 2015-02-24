//
//  SignUpViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SignUpViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize userNameField, emailField, password1Field, password2Field, cameraLensView, addProfilePicButton, imageData, imageThumbnail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - CREATE AND LAYOUT ALL VIEW ELEMENTS
- (void)viewDidLoad
{
    // Set this status bar to default
    [self setNeedsStatusBarAppearanceUpdate];
    [super viewDidLoad];
    
    // ADD BACKGROUND IMAGE
    [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBg"]]];
    
    // ADD LOGO
    [self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]]];
    
    // ADD CAMERA IMAGE
    cameraLensView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cameraBlue"]];
    [self.signUpView addSubview:self.cameraLensView];
    [self.signUpView sendSubviewToBack:self.cameraLensView];
    
    // ADD IMAGEVIEW FOR PROFILE IMAGE
    // Create the view to hold the user's image once it returns from the picker, add the corner radius so it will be a circle
    imageThumbnail = [[UIImageView alloc] init];
    // Set the image to nil in case user already registered and an image is there
    imageThumbnail.image = nil;
    [self.signUpView addSubview:self.imageThumbnail];
    [self.signUpView sendSubviewToBack:self.imageThumbnail];
    
    // ADD PICTURE BUTTON
    // Create the button and set it to launch the media controller when tapped
    addProfilePicButton = [[UIButton alloc] init];
    [addProfilePicButton setBackgroundImage:[UIImage imageNamed:@"smallBlueBtn"] forState:UIControlStateNormal];
    [addProfilePicButton setBackgroundImage:[UIImage imageNamed:@"smallBlueBtnHl"] forState:UIControlStateHighlighted];
    [addProfilePicButton addTarget:self action:@selector(launchCamera) forControlEvents:UIControlEventTouchUpInside];
    [addProfilePicButton setTitle:@"Add Profile Picture" forState:UIControlStateNormal];
    [addProfilePicButton setTitle:@"Add Profile Picture" forState:UIControlStateHighlighted];
    addProfilePicButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    [self.signUpView addSubview:self.addProfilePicButton];
    [self.signUpView sendSubviewToBack:self.addProfilePicButton];
    
    // ADD USER FIELDS
    // Use Parse's usernameField for the user's full name (save their email address as their username
    // Send the views to the back so we can see the field labels on top
    userNameField = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textFieldHl"]];
    [self.signUpView addSubview:self.userNameField];
    [self.signUpView sendSubviewToBack:self.userNameField];
    [self.signUpView.usernameField setPlaceholder:@" John Smith"];
    self.signUpView.usernameField.textAlignment = NSTextAlignmentLeft;
    [self.signUpView.usernameField setTextColor:[UIColor grayColor]];
    
    emailField = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textFieldHl"]];
    [self.signUpView addSubview:self.emailField];
    [self.signUpView sendSubviewToBack:self.emailField];
    [self.signUpView.emailField setPlaceholder:@" Email"];
    self.signUpView.emailField.textAlignment = NSTextAlignmentLeft;
    [self.signUpView.emailField setTextColor:[UIColor grayColor]];
    
    password1Field = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textFieldHl"]];
    [self.signUpView addSubview:self.password1Field];
    [self.signUpView sendSubviewToBack:self.password1Field];
    [self.signUpView.passwordField setPlaceholder:@" Password"];
    self.signUpView.passwordField.textAlignment = NSTextAlignmentLeft;
    [self.signUpView.passwordField setTextColor:[UIColor grayColor]];
    
    password2Field = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textFieldHl"]];
    [self.signUpView addSubview:self.password2Field];
    [self.signUpView sendSubviewToBack:self.password2Field];
    [self.signUpView.additionalField setPlaceholder:@" Repeat Password"];
    self.signUpView.additionalField.textAlignment = NSTextAlignmentLeft;
    [self.signUpView.additionalField setTextColor:[UIColor grayColor]];
    
    
    // ADD REGISTER BUTTON
    [self.signUpView.signUpButton setBackgroundImage:[UIImage imageNamed:@"GrnBtn"] forState:UIControlStateNormal];
    [self.signUpView.signUpButton setBackgroundImage:[UIImage imageNamed:@"GrnBtnHL"] forState:UIControlStateHighlighted];
    
    // Stop parse from their sign up action
    [self.signUpView.signUpButton   addTarget:nil action:nil forControlEvents:UIControlEventAllEvents];
    // Use my own action
    [self.signUpView.signUpButton  addTarget:self action:@selector(checkUserInformation) forControlEvents:UIControlEventTouchUpInside];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Set the frame sizes for all the elements
    // Buttons & Images
    [self.signUpView.logo setFrame:CGRectMake(76.0f, 40.0f, 168.0f, 46.0f)];
    [cameraLensView setFrame:CGRectMake(125.0f, 110.0f, 70.0f, 70.0f)];
    [addProfilePicButton setFrame:CGRectMake(95.0f, 170.0f, 130.0f, 40.0f)];
    [imageThumbnail setFrame:CGRectMake(125.0f, 110.0f, 70.0f, 70.0f)];
    
    // SET FIELD LABELS
    [self.signUpView.usernameField setFrame:CGRectMake(25.0f, 230.0f, 270.0f, 40.0f)];
    [self.signUpView.emailField setFrame:CGRectMake(25.0f, 280.0f, 270.0f, 40.0f)];
    [self.signUpView.passwordField setFrame:CGRectMake(25.0f, 330.0f, 270.0f, 40.0f)];
    [self.signUpView.additionalField setFrame:CGRectMake(25.0f, 380.0f, 270.0f, 40.0f)];
    
    // SET FIELD BACKGROUNDS
    [userNameField setFrame:CGRectMake(20.0f, 230.0f, 280.0f, 40.0f)];
    [emailField setFrame:CGRectMake(20.0f, 280.0f, 280.0f, 40.0f)];
    [password1Field setFrame:CGRectMake(20.0f, 330.0f, 280.0f, 40.0f)];
    [password2Field setFrame:CGRectMake(20.0f, 380.0f, 280.0f, 40.0f)];
    
    // REGISTER A NEW USER BUTTON
    [self.signUpView.signUpButton setFrame:CGRectMake(20.0f, 435.0f, 280.0f, 42.0f)];
    
}


-(BOOL)checkUserInformation
{
    NSLog(@"Checking information");
    NSString* errorString;
    // Check to make sure all the fields are valid
    if (imageThumbnail.image == nil)
    {
        // we have no image
        errorString = @"Whoops, you forgot to add a profile pic!";
        NSLog(@"%@", errorString);
    }
    // get the text entered onthe fields
         NSString* nameEntered = self.signUpView.usernameField.text;
         NSString* emailEntered = self.signUpView.emailField.text;
         NSString* password1 = self.signUpView.passwordField.text;
         NSString* password2 = self.signUpView.additionalField.text;
    if (password1 != password2)
    {
        errorString = @"Sorry, the passwords do not match.";
        NSLog(@"%@", errorString);
    }
    if (nameEntered || emailEntered == nil)
    {
        errorString = @"Missing Infromation";
        NSLog(@"%@", errorString);
    }
    /*
    NSMutableDictionary* userInfoDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    UIImage *img = ...;
    [dict setObject:img forKey:@"aKeyForYourImage"];
    
    UIImage *imgAgain = [dict objectForKey:@"aKeyForYourImage"];
     */
    return false;
}
- (BOOL) shouldAutorotate
{   // Stop the view from rotating when the device is turned
    return NO;
}

// Change status bar to dark text color
- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark - USER PROFILE PICTURE METHODS
-(void)launchCamera
{
    NSLog(@"User hit camera button");
    UIImagePickerController* pickerVC = [[UIImagePickerController alloc] init];
    if (pickerVC != nil)
    {
        // Use the device camera and allow editing and set to full screen to prevent snapshotting error
        pickerVC.modalPresentationStyle = UIModalPresentationFullScreen;
        pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerVC.allowsEditing = TRUE;
        // set the delegate and display the picker
        pickerVC.delegate = self;
        [self presentViewController:pickerVC animated:true completion:nil];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", info.description);
    // Get the edited image from the picker so it will not be too big for Parse
    UIImage* dataThumbnail = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (dataThumbnail != nil) {
        // Create a png thumbnail of this image to display in the user registration view
        imageData = UIImagePNGRepresentation(dataThumbnail);
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
