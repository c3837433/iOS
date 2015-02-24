//
//  ViewController.h
//  AOC Project 3
//
//  Created by Angela Smith on 2/17/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

// Import the AddEvent controller so it is aware of the AddEventDelegate
#import "AddEventViewController.h"

// Attach the new event delegate to the view
@interface ViewController : UIViewController <AddEventDelegate>
{
    // create the outlet that will contain the captured event data
    IBOutlet UITextView *eventDataField;
    // define a string that will hold each new event
    NSString* newString;
    // define a sutable string that will receive the appended events
    NSMutableString* newEventString;
}

-(IBAction)addEvent:(UIStoryboardSegue*)seque;

@end
