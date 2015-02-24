//
//  ViewController.m
//  Project4
//
//  Created by Angela Smith on 2/24/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
// import the AddEventViewController
#import "AddEventViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    newEventString = [[NSMutableString alloc] init];
    // load the saved event data when the project runs
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults!= nil) {
        // create strings to get the values out
        NSString *eventsFieldText = [defaults objectForKey:@"event"];
        // set the string to the field
        eventDataField.text = eventsFieldText;
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveOnClick:(id)sender
{
    // save values in text field with NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // collect the text
    if (defaults!= nil)
    {
        // set the text to a string
        NSString* eventsFieldText = eventDataField.text;
        // save the default data
        [defaults setObject:eventsFieldText forKey:@"event"];
        // to make sure the data gets saved, we need to syncronize it
        [defaults synchronize];
    }
}
/*
 // Get the data passed back via the unwind segue
 AddEventViewController* addEventVC = segue.sourceViewController;
 if (eventsString == nil) {
 eventsString = [[NSMutableString alloc] init];
 if (![eventsList.text  isEqual: @""]) {
 // add what is currently in the textView plus a line break to the Mutable String
 [eventsString appendString:eventsList.text];
 [eventsString appendString:@"\n"];
 }
 // take the data brought back from it and add it to the mutable string
 [eventsString appendString:addEventVC.eventNextString];
 // add a line break to the string
 [eventsString appendString:@"\n"];
 // get the text in the field
 NSLog(@"%@", eventsList.text);
 // display the new string to the textView
 eventsList.text = eventsString;
 // save the text to the defaults
 [self saveList];
 } else {
 // if this is not the first string
 // just add the new text to the events string
 [eventsString appendString:addEventVC.eventNextString];
 [eventsString appendString:@"\n"];
 eventsList.text = eventsString;
 // save the text to the defaults
 [self saveList];
 }
 */

/*// Return to the first view controller
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSString* newText = [[NSString alloc] initWithFormat:@"%@", eventField.text];
    NSLog(@"%@",newText);
    if (([newText  isEqualToString: @""])|| ([newText  isEqualToString: @"Enter Event Information"]) )
    {
        return NO;
    } else if ([identifier isEqualToString:@"SegueReturningToEventList"])
    {
        NSLog(@"This is a good String");
    }
    if ([identifier isEqualToString:@"SegueReturningToEventList"])
    {
    return YES;
    }
    return NO;
}
 */
-(IBAction)saveAndReturn:(UIStoryboardSegue*)segue
{
    // Get the data passed back via the unwind segue
    AddEventViewController* addEventVC = segue.sourceViewController;
    // take the data brought back from it and add it to the mutable string
    [newEventString appendString:addEventVC.eventNextString];
    
    // add a line break to the string
    [newEventString appendString:@"\n"];
    // add the text to the textview
    eventDataField.text = newEventString;
    
}
/*
// Create the seque action to move to the Add Event view when the Add Event button is clicked
-(IBAction)addEvent:(UIStoryboardSegue*)segue
{
    // Create the Add event view
    AddEventViewController *eventController = [[AddEventViewController alloc] initWithNibName:@"AddEventViewController" bundle:nil];
    // If it was created correctly, move to the view when the "Add Event" button is clicked
    if (eventController != nil) {
        [self presentViewController:eventController animated:true completion:nil];
    }
}

-(IBAction)returnFromAddEvent:(UIStoryboardSegue*)segue
{
    // set the event data field text to the event string text
    //eventDataField.text = eventString;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults!= nil) {
        // create strings to get the values out
        // technically these should be checked to make sure they are not nil
        // if they come out nul, then they wer not created
        NSString *eventString = [defaults objectForKey:@"event"];
        // check that the event field is not empty
        // if the newString has no data in it
        if (newString == nil) {
            // store the event data into the string
            newString = eventString;
            // create and init the mutable string to hold the data
            newEventString = [[NSMutableString alloc] init];
            // add the string and a carriage break to the string
            [newEventString appendString:newString];
            [newEventString appendString:@"\r"];
        } else {
            // if there is alreayd data in it reset the new string to it
            newString = eventString;
            // add add that new string and a carriage break to the event string
            [newEventString appendString:newString];
            [newEventString appendString:@"\r"];
        }
        // store the new string in the event text field
        eventDataField.text = newEventString;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Use Prepare for segue to pass the information from the AddEvent controller
    AddEventViewController *eventController = (AddEventViewController*)segue.destinationViewController;
    

}
 */
// Close the keyboard when enter is selected
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // close the keyboard
    [self.view endEditing:true];
    return true;
}
@end
