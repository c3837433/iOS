//
//  ViewController.m
//  AOC Project 3
//
//  Created by Angela Smith on 2/17/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.


#import "ViewController.h"
// Import the other view controller
#import "AddEventViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// CREATE AND MOVE TO THE SECOND VIEW
// Create the seque action to move to the Add Event view when the Add Event button is clicked
-(IBAction)addEvent:(UIStoryboardSegue*)segue
{
    // Create the Add event view
    AddEventViewController *eventController = [[AddEventViewController alloc] initWithNibName:@"AddEventViewController" bundle:nil];
    // If it was created correctly, move to the view when the "Add Event" button is clicked
    if (eventController != nil) {
        // add the event controller
        eventController.delegate = self;
        [self presentViewController:eventController animated:true completion:nil];
    }
}

// ADD NEWLY CREATED EVENT TO THE UITEXTVIEW
// Implement the delegate
-(void)WhenReturnWithInfo:(NSString *)eventString
{
    
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

    // set the event data field text to the event string text
    //eventDataField.text = eventString;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Use Prepare for segue to pass the information from the AddEvent controller
    AddEventViewController *eventController = (AddEventViewController*)segue.destinationViewController;
    eventController.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
