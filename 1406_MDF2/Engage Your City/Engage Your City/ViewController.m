//
//  ViewController.m
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
#import "MyLogInViewController.h"
#import "MySignUpViewController.h"
#import "ActionsTableViewCell.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    // Apply light effect
    UIImage* bgimage = [UIImage imageNamed:@"mlps.png"];
    bgImage.image = [bgimage applyLightEffect];
    //bgImage.image = bgimage;
    
    NSString* wholeString = @"I flew out to Washington DC this morning, and about half way through the flight there was a big commotion at the back of the plane and soon, over the intercom they were asking for medical personnel to come back to the back of the plane.  I got up and walked to the back of the plane and they asked if I was a doctor and I said that I work for the Great physician and was a children’s pastor, and that I wanted to pray for the woman. She was an older women, in her 70′s, and had passed out and had low pulse as she didn’t take her medication, was stressed and hadn’t slept for two days.  They let me squeeze in and I took her hand and she looked at me through her oxygen mask, I told her who I was and that God sent me here to pray for her and that she was going to be fine….I prayed declared healing, and released the Kingdom…she smiled, cried, and seemed to perk up. The flight attendant asked if I would stay there and be with her two grand kids that were really scared.  I was able to pray for them, minister to them sit in their seats with them. It turns out their Uncle, who they were going to visit works in the Pentagon, and is the liaison to the joint chief of staff of the Navy. I walked the children off the plane, met him and prayed for them all again.  He thanked me and said that just this morning he was saying how God puts people in places for a reason….Amen to that!";
    
    NSString* shortString;
    NSString* final;
    if (wholeString.length > 300)
    {
        shortString = [wholeString substringToIndex:300];
        //NSLog(@"%@", shortString);
        //NSCharacterSet* space = [NSCharacterSet whitespaceCharacterSet];
        NSRange lastSpace = [shortString rangeOfString:@" " options:NSBackwardsSearch];
        // Get the new string with the shortened character limit
        final = [NSString stringWithFormat:@"%@...", [shortString substringToIndex:lastSpace.location]];
        //NSLog(@"%@", final);
    }
    messageTextView.text = final;
    messageTitle.text = @"Airplane Ministry";

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        [self viewLoginScreen];
    }
}
-(void)viewLoginScreen
{
    MyLogInViewController* logInViewController = [[MyLogInViewController alloc] init];
    [logInViewController setDelegate:self]; // Set ourselves as the delegate
   
    // Add FACEBOOK and TWITTER
    logInViewController.facebookPermissions = @[@"friends_about_me"];
    logInViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton;
    
    
    // Create the sign up view controller
    MySignUpViewController* signUpViewController = [[MySignUpViewController alloc] init];
    [signUpViewController setDelegate:self]; // Set ourselves as the delegate
    
    // Assign our sign up controller to be displayed from the login controller
    [logInViewController setSignUpController:signUpViewController];
    
    
    // Present the log in view controller
    [self presentViewController:logInViewController animated:YES completion:NULL];
}

// VERIFY THE USER SIGNED IN WITHOUT EMPTY FIELDS
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Please fill in both fields!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in to close the LogIn
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Return to main screen when user logs out
- (IBAction)logOutButtonTapAction:(id)sender {
    [PFUser logOut];
    [self viewLoginScreen];
    //[self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActionsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"laborerActionsCell"];
    if (cell != nil)
    {
        NSArray* cellArray = @[@"1. Pray", @"2. Love", @"3. Gather"];
        cell.eventName.text = [cellArray objectAtIndex:indexPath.row];
        if (indexPath.row == 0)
        {
            // blue
            cell.backgroundColor = [UIColor colorWithRed:0.07 green:0.57 blue:0.76 alpha:1];
        }
        else if (indexPath.row == 1)
        {
            // dr blue
            cell.backgroundColor = [UIColor colorWithRed:0.02 green:0.38 blue:0.54 alpha:1];
        }
        else if (indexPath.row == 2)
        {
            // green
            cell.backgroundColor = [UIColor colorWithRed:0.52 green:0.82 blue:0.32 alpha:1];
        }
        //cell.textLabel.text = @"hello";
        /*
         Daily:
         Pray
         - For laborers to be sent into fields of harvest
         - For souls to be save
         
         Weekly:
         Demonstrate Supernatural Love
         - Word of Prophecy or Encouragement
         - Act of service or generosity
         - Healing or prayer ministry
         - Share God stories with people or introducing someone to Jesus
         
         Monthly:
         Coming together with other laborers to
         - Share God stories/testimonies 
         - Encounter the Lord 
         - Connect with one another
         
         Initially all cells will have same height so in heightForRowAtIndexPath will return same height say 40.
         When user clicks on any cell, store that index path in some variable and call reloadData for tableView, which will call heightForRowAtIndexPath, in this you check for selected cell index path and return height say 100, which will display user info also.
         */
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
