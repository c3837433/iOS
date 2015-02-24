//
//  SubjectFormulaViewController.h
//  Physics
//
//  Created by Angela Smith on 3/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubjectFormulaViewController : UIViewController <UITextFieldDelegate>
{
    // Create outlets for the formula entries
    IBOutlet UILabel* subjectNotes;
    IBOutlet UILabel* valueX;
    IBOutlet UILabel* valueY;
    IBOutlet UILabel* valueTotal;
    
    // Create the outlets to calculate the formula
    IBOutlet UITextField* enteredX;
    IBOutlet UITextField* enteredY;
    IBOutlet UILabel* returnedResult;
    
}
// Create properties to hold the formula strings
@property(nonatomic, strong)NSString* formulaTitle;
@property(nonatomic, strong)NSString* measureX;
@property(nonatomic, strong)NSString* measureY;
@property(nonatomic, strong)NSString* measureResult;
@property(nonatomic, strong)NSString* formulaNotes;
@property(nonatomic, strong)NSString* subjectName;

// define a method that will calculate the variables entered
-(void)calculateEnteredVariables:(int) variableX variableY:(int) variableY;
// and an onclick method when the calculate button is clicked
-(IBAction)onClick:(id)sender;
@end
