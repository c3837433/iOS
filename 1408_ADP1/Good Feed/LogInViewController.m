//
//  LogInViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "LogInViewController.h"
#import "MySignUpViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize emailFieldView, passwordFieldView, separatorOrLineView, registerButton,registerLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark SET UP LOGIN VIEW
- (void)viewDidLoad
{
    // Because this background is very light, change the status bar to the regular style
    [self setNeedsStatusBarAppearanceUpdate];
    
    [super viewDidLoad];
    // ADD A BACKGROUND IMAGE
    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBg"]]];
    
    // ADD THE LOGO
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]]];
    
    // LOGIN FIELDS
    emailFieldView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textFieldHl"]];
    [self.logInView addSubview:self.emailFieldView];
    [self.logInView sendSubviewToBack:self.emailFieldView];
    [self.logInView.usernameField setPlaceholder:@"Email"];
    self.logInView.usernameField.textAlignment = NSTextAlignmentLeft;
    [self.logInView.usernameField setTextColor:[UIColor grayColor]];
    // set keyboard to email
    self.logInView.usernameField.keyboardType = UIKeyboardTypeEmailAddress;
    
    passwordFieldView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textFieldHl"]];
    [self.logInView addSubview:self.passwordFieldView];
    [self.logInView sendSubviewToBack:self.passwordFieldView];
    [self.logInView.passwordField setPlaceholder:@"Password"];
    [self.logInView.passwordField setTextColor:[UIColor grayColor]];
    self.logInView.passwordField.textAlignment = NSTextAlignmentLeft;
    // remove the shadow on the placeholder text
    self.logInView.passwordField.layer.shadowColor = (__bridge CGColorRef)([UIColor clearColor]);
    
    // FORGOT PASSWORD BUTTON
    [self.logInView.passwordForgottenButton setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    [self.logInView.passwordForgottenButton setTitle:@"Forgot Password?" forState:UIControlStateHighlighted];
    [self.logInView.passwordForgottenButton setBackgroundImage:nil forState:UIControlStateNormal];
    [self.logInView.passwordForgottenButton setBackgroundImage:nil forState:UIControlStateHighlighted];
    self.logInView.passwordForgottenButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    [self.logInView.passwordForgottenButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    // LOG IN BUTTON
    [self.logInView.logInButton setBackgroundImage:[UIImage imageNamed:@"GrnBtn"] forState:UIControlStateNormal];
    [self.logInView.logInButton setBackgroundImage:[UIImage imageNamed:@"GrnBtnHL"] forState:UIControlStateHighlighted];
    [self.logInView.logInButton setTitle:@"Log In" forState:UIControlStateHighlighted];
    
    
    // LINE SEPARATOR
    separatorOrLineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"orLinePic"]];
    [self.logInView addSubview:self.separatorOrLineView];
    [self.logInView sendSubviewToBack:self.separatorOrLineView];
    [self.logInView.externalLogInLabel removeFromSuperview];
    
    // FACEBOOK BUTTON
    [self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"FbBtn"] forState:UIControlStateNormal];
    [self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"FbBtnHl"] forState:UIControlStateHighlighted];
    [self.logInView.facebookButton setTitle:@" Log in with Facebook" forState:UIControlStateNormal];
    [self.logInView.facebookButton setTitle:@" Log in with Facebook" forState:UIControlStateHighlighted];
    [self.logInView.facebookButton setImage:[UIImage imageNamed:@"fbIcon"] forState:UIControlStateNormal];
    [self.logInView.facebookButton setImage:[UIImage imageNamed:@"fbIcon"] forState:UIControlStateHighlighted];
    
    // REGISTER NOW BUTTON AND LABEL
    registerButton = [[UIButton alloc] init];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"GreyBtn"] forState:UIControlStateNormal];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"GreyBtnHl"] forState:UIControlStateHighlighted];
    [registerButton addTarget:self action:@selector(openSignUpViewController) forControlEvents:UIControlEventTouchUpInside];
    [registerButton setTitle:@"Register Now" forState:UIControlStateNormal];
    [registerButton setTitle:@"Register Now" forState:UIControlStateHighlighted];
    [self.logInView addSubview:registerButton];
    [self.logInView sendSubviewToBack:registerButton];
    registerLabel = [[UILabel alloc] init];
    [self.logInView addSubview:registerLabel];
    [self.logInView sendSubviewToBack:registerLabel];
    registerLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    [registerLabel setTextColor:[UIColor grayColor]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Field and button frames are 280X42
    // Set frame for elements
    // LOGO
    [self.logInView.logo setFrame:CGRectMake(76.0f, 40.0f, 168.0f, 46.0f)];
    
    // SIGN IN TEXTFIELDS
    [self.logInView.usernameField setFrame:CGRectMake(25.0f, 130.0f, 270.0f, 40.0f)];
    [self.logInView.passwordField setFrame:CGRectMake(25.0f, 180.0f, 270.0f, 40.0f)];
    [emailFieldView setFrame:CGRectMake(20.0f, 130.0f, 280.0f, 42.0f)];
    [passwordFieldView setFrame:CGRectMake(20.0f, 180.0f, 280.0f, 42.0f)];
    
    // BUTTONS AND THEIR LABELS
    [self.logInView.logInButton setFrame:CGRectMake(20.0f, 260.0f, 280.0f, 42.0f)];
    [self.logInView.passwordForgottenButton setFrame:CGRectMake(170.0f, 225.0f, 150.0f, 15.0f)];
    [separatorOrLineView setFrame:CGRectMake(20.0f, 310.0f, 280.0f, 17.0f)];
    [self.logInView.facebookButton setFrame:CGRectMake(20.0f, 335.0f, 280.0f, 42.0f)];
    [registerButton setFrame:CGRectMake(20.0f, 430.0f, 280.0f, 42.0f)];
    registerLabel.text = @"Not registered with Good Feed yet?";
    [registerLabel setFrame:CGRectMake(65.0f, 410.0f, 200.0f, 15.0f)];
}

- (BOOL) shouldAutorotate
{
    return NO;
}

// Background is light, change status bar to dark
- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

// MILESTONE 1:5 (Continues with PFLogin Controller Delegate)
#pragma mark UITEXTFIELD DELEGATE
// Check the entered text
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    // Check the email (username) field
    if (textField == self.logInView.usernameField)
    {
        // Convert the email to lowercase to match the stored parse username
        textField.text = [textField.text lowercaseString];
    }
    return YES;
}

#pragma mark PFLOGIN CONTROLLER DELEGATE
// Check that log in information is correct
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password
{
    // Make sure the email (username) is lowercase, if so continue
    return ([username rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]].location == NSNotFound);
}


#pragma mark NAVIGATION METHODS
-(void)didSignUpUser
{
    NSLog(@"Dismissing the Log In View Controler");
    // When returning from the sign up controller, check if the user signed up, if so return to the launch screen otherwise stay ont he log in screen
    if ([PFUser currentUser])
    {
        [self.parentViewController dismissViewControllerAnimated:NO completion:NULL];
    }
}

-(void)openSignUpViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MySignUpViewController* signUpVC = [storyboard instantiateViewControllerWithIdentifier:@"signUpVC"];
    [self presentViewController:signUpVC animated:NO completion:NULL];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
