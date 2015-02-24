//
//  SubjectFormulaViewController.m
//  Physics
//
//  Created by Angela Smith on 3/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SubjectFormulaViewController.h"

@interface SubjectFormulaViewController ()

@end

@implementation SubjectFormulaViewController
// synthesize the new property values
@synthesize measureResult, measureX, measureY, formulaNotes, formulaTitle, subjectName;


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
    // set this object's properties to the view
    subjectNotes.text = self.formulaNotes;
    valueX.text = self.measureX;
    valueY.text = self.measureY;
    valueTotal.text = self.measureResult;
    
    // set the keyboards to numeric only
    enteredY.keyboardType = UIKeyboardTypeNumberPad;
    enteredX.keyboardType = UIKeyboardTypeNumberPad;
    
    // Create a gesture recognizer so that when the user clicks off the uitextfield, it will call the method that will dismiss the keyboard while on this view
    UITapGestureRecognizer *clickOnScreen = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(closeKeyboard)];
    // Call the method
    [self.view addGestureRecognizer:clickOnScreen];
    
    // Check the subject name to determine if a value needs to be pre-entered
    if ([self.subjectName isEqualToString:@"Gravity"]) {
        //the set the Acceleration value in the textfield
        enteredY.text = @"9.8";
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
// Calculation the formula
-(void)calculateEnteredVariables:(int) variableX variableY:(int) variableY
{
    // calculate the value
    int total = variableX * variableY;
    // turn the integer back into a string
    NSString* result = [NSString stringWithFormat:@"%@= %d %@",self.subjectName, total, self.measureResult];
    // display the string to the result field
    returnedResult.text = result;
}

// Close the keyboard when the user clicks off the textfields
-(void)closeKeyboard {

    // when the user clicks on either of the text fields, close the keyboard
    [enteredX resignFirstResponder];
    [enteredY resignFirstResponder];
}
-(IBAction)onClick:(id)sender
{
    // gather the valued strings entered in the text fields and convert them to ints
    int x = [enteredX.text intValue];
    int y = [enteredY.text intValue];
    // pass these values to the calculate method
    [self calculateEnteredVariables:x variableY:y];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
