//
//  AddEventViewController.h
//  AOC Project 3
//
//  Created by Angela Smith on 2/17/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

// Define a new protocol for the delegate to pass the data back
@protocol AddEventDelegate <NSObject>
    // Give the delegate the required callback method
@required
    -(void)WhenReturnWithInfo:(NSString*)eventString;
@end

// attach the UITextField delegate to the view
@interface AddEventViewController : UIViewController <UITextFieldDelegate>
{
    // Give the delegate an id
    id<AddEventDelegate> delegate;
    // Create an outlet to hold the entered event
    IBOutlet UITextField *enteredText;
    IBOutlet UILabel *errorLabel;
}

// set the delegate so it can be accessed outside
@property (strong) id<AddEventDelegate> delegate;

// return to the first view with new event data
-(IBAction)returnToMain:(id)sender;

// Method to perform when the close keyboard is pressed
-(IBAction)closeKeyboard:(id)sender;

@end
