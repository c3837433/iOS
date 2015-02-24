//
//  ViewController.h
//  AOC 1402 Project 2
//
//  Created by Angela Smith on 2/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// CREATED METHODS
    
// 1. Create a method that takes two integers and returns the total
-(int) Add: (int)first to:(int) second;
// 2. Create a BOOL method that compares two integers and returns whether they are equal or not.
-(BOOL) Compare: (NSInteger)A with:(NSInteger)B;
// 3. Create a method that take two NSStrings and return a new NSString containing the appended string.
-(NSString*) Append: (NSString*)begin to: (NSString*)end;
// 4. Create a method that takes in a string and displays an alert using the string.
-(void)DisplayAlertWithString: (NSString*)alertTitle message: (NSString*) alertMessage;
- (IBAction)appendButton:(id)sender;
- (IBAction)numberButton:(id)sender;
- (IBAction)compareButton:(id)sender;

@end
