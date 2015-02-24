//
//  AddEventViewController.m
//  Project4
//
//  Created by Angela Smith on 2/24/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AddEventViewController.h"


@interface AddEventViewController ()

@end

@implementation AddEventViewController
@synthesize eventNextString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

// Return to the first view controller


// Return to the first view controller
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"returnToEventList"]) {
        NSString* newText = [[NSString alloc] initWithFormat:@"%@", eventField.text];
        NSLog(@"%@",newText);
        if (([newText  isEqualToString: @""])|| ([newText  isEqualToString: @"Enter Event Information"]) ) {
            NSLog(@"This is not a valid string");
            // create an alert notification
            UIAlertView* eventAlert = [[UIAlertView alloc] initWithTitle:@"No Event Entered" message:@"Please enter an event" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            // display the alert
            [eventAlert show];
            return NO;
        }
        //if ([identifier isEqualToString:@"returnToEventList"])
        /* {
            NSLog(@"This is a good String");
            // gather up the default data to return to the first view with it
            NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
            // if the default was created
            if (defaults != nil)
            {
                // set the new text to the event object and syncronize
                [defaults setObject:newText forKey:@"newEvent"];
                [defaults synchronize];
            }
        }*/
    }
    return YES;
}

-(IBAction)closeKeyboard:(id)sender
{
    // Stop the first responder (the keyboard)
    [self.view endEditing:true];
    // go to the textFieldShouldReturn method to close the keyboard
    [self textFieldShouldReturn:sender];
}
// Clear out textfield when clicked on
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    eventField.text = @"";
    return true;
}

// Close the keyboard when enter is selected
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // close the keyboard
    [self.view endEditing:true];
    return true;
}
// prepart for segue that will be the main source
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // check for the identifier for the unwind segue
    if ([segue.identifier isEqualToString:@"returnFromNewEvent"])
    {
        // do something
        //eventNextString = eventField.text;
    }
    
}

@end
