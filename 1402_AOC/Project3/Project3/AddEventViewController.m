//
//  AddEventViewController.m
//  AOC Project 3
//
//  Created by Angela Smith on 2/17/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.

#import "AddEventViewController.h"
#import "ViewController.h"

@interface AddEventViewController ()

@end

@implementation AddEventViewController
// Synthesize the Add Event Delegate
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// GATHER THE TEXT AND RETURN TO THE MAIN VIEW
-(IBAction)returnToMain:(id)sender
{
    if (delegate != nil) {
        // Create a string to hold the newly entered text from the text field
        NSString* newText = [[NSString alloc] initWithFormat:@"%@", enteredText.text];
        NSLog(@"%@",newText);
        // Check to make sure the field is not blank, or still contains default text
        if (([newText  isEqualToString: @""])|| ([newText  isEqualToString: @"Enter event information"]) ) {
            NSLog(@"This is not an okay string");
            // If default or blank, display hidden error label
            errorLabel.hidden = false;
        }
        // If the field has new text
        else
        {
        NSLog(@"This is a new good string");
        // call the delegate and pass the new text
        [delegate WhenReturnWithInfo:enteredText.text];
        // Return to the first view
        [self dismissViewControllerAnimated:true completion:nil];
        }
    }
}
// PROROCOLS
// Close Keyboard when button is pressed
-(IBAction)closeKeyboard:(id)sender
{
    // Stop the first responder (the keyboard)
    //[self.view endEditing:true];
    // go to the textFieldShouldReturn method to close the keyboard
    [self textFieldShouldReturn:sender];
}
// When the text field is clicked on
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // Trun of the error label
    errorLabel.hidden = true;
    // Empty out the textField
    textField.text = @"";
    return true;
}
// Close the Keyboard when the the user selects enter on keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // close the keyboard
    [self.view endEditing:true];
    return true;
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
