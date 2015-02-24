//
//  ViewController.m
//  AOC 1402 Project 2
//
//  Created by Angela Smith on 2/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


// CREATED METHODS
// 1. ADD: a method that takes two integers: first, and second.
-(int) Add: (int)first to:(int) second
{
    // add the two values and return the result of the addition
    int result = first + second;
    return result;
}
// 2. COMPARE: a BOOL method that takes two NSInteger values, and returns YES or NO based on whether the values are equal.
-(BOOL) Compare: (NSInteger)A with:(NSInteger)B
{
    if (A == B)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

// 3. APPEND: a method that takes two NSStrings and return a new NSString containing the appended strings using an NSMutableString and the appendString method.
-(NSString*) Append: (NSString*)begin to: (NSString*)end
{
    NSMutableString * fullString = [[NSMutableString alloc] init];
    [fullString appendString:begin];
    [fullString appendString:end];
    return fullString;
}

// 4. DISPLAY ALERT WITH STRING: A method that take a NSString parameter, and passes it in an alert view using UIAlertView. (Also passes in an optional Title).
-(void)DisplayAlertWithString: (NSString*)alertTitle message: (NSString*) alertMessage
{
    // Create the alert to be displayed
    UIAlertView * newAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@", alertTitle] message:[NSString stringWithFormat:@"%@", alertMessage] delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil];
    // check that the alert was created correctly
    if (newAlert != nil) {
        // show the alert with the passed texts
        [newAlert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ACTION when APPEND BUTTON is CLICKED
- (IBAction)appendButton:(id)sender
{
    // 1. Create two strings
    NSString* beginningString = @"Now is the time for all good men ";
    NSString* endString = @"to come to the aid of their land.";
    // APPEND the two strings together and store the new strings into a variable
    NSString* fullString = [self Append:beginningString to:endString];
    //NSLog(@"%@", string);
    // pass the new string into an alert using DisplayAlertWithStrings
    [self DisplayAlertWithString:@"Typing Practice" message:fullString];
}

// ACTION when NUMBER BUTTON is CLICKED
- (IBAction)numberButton:(id)sender
{
    // 2.  Call the ADD function passing in two integers returning the result
    int addTwo = [self Add:5 to:7];
    
    // 3. TURN INTEGER INTO NSNUMBER, THEN STRING AND PASS TO ALERT FUNCTION
    // create a NSNumber from the ADD integer
    NSNumber* numberTotal = [NSNumber numberWithInt:addTwo];
    // convert the number into a string
    NSString* numberToString = [numberTotal stringValue];
    //NSLog(@"%@", numString);
    
    // 4. GIVE THE MESSAGE A TITLE AND TEXT
    // Set the first half of the message to numMess
    NSString* numMessage = @"The number is ";
    // Append the new number to the string
    NSString* numberString = [self Append:numMessage to:numberToString];
    // call an alert with the new number
    [self DisplayAlertWithString:@"Changing Numbers" message:numberString];
}

// ACTION when COMPARE BUTTON is CLICKED
- (IBAction)compareButton:(id)sender
{
    // 5. CALL COMPARE AND DISPLAY ALERT IF NUMBERS ARE EQUAL
    int compareValueA = 14;
    int compareValueB = 14;
    BOOL comparison = [self Compare:compareValueA with:compareValueB];
    // if compareison is YES display alert view
    if (comparison) {
        // Changes the boolean into a string of 0 or 1
        //NSString* newBool = [NSString stringWithFormat:@"%d", comparison];
        // Change the bool value to string text YES or NO
        NSString* stringFromBool = comparison ? @"YES" : @"NO";
        // Sets a string to contain the message of the values and whether or not they are equal
        NSString* compareAlertMessage = [NSString stringWithFormat:@"Are the values %d and %d equal? %@", compareValueA, compareValueB, stringFromBool];
        // displays the alertView with the values and result
        [self DisplayAlertWithString:@"Compared Values" message:compareAlertMessage];
    }
}
@end