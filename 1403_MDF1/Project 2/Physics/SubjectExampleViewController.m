//
//  SubjectExampleViewController.m
//  Physics
//
//  Created by Angela Smith on 3/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SubjectExampleViewController.h"
#import "SubjectDetailViewController.h"
#import "SubjectFormulaViewController.h"

@interface SubjectExampleViewController ()

@end

@implementation SubjectExampleViewController
// Synthesize the properties
@synthesize thisSubject, currentExample, formulaLink;

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
    // set the example to the view
    //example.text = self.currentExample;
    example.text = self.thisSubject.subjectExample;
    
    
    // Check to see if the current subject has a formula
    if (self.thisSubject.formula == false) {
        // remove the link to the calculations view because their isnt't one to make
        [self.navigationItem setRightBarButtonItem:nil];
    }/* else {
        [self.navigationItem setRightBarButtonItem:formulaLink];
    }*/
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Pass the data when transitioning to the next page with prepare for segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SubjectFormulaViewController* subjectFormulaVC = segue.destinationViewController;
    if (subjectFormulaVC != nil) {
        // pass the data to the formula page
        subjectFormulaVC.measureX = thisSubject.formulaX;
        subjectFormulaVC.measureY = thisSubject.formulaY;
        subjectFormulaVC.measureResult = thisSubject.formulaValue;
        subjectFormulaVC.formulaTitle = thisSubject.subjectName;
        subjectFormulaVC.formulaNotes = thisSubject.formulaNotes;
        subjectFormulaVC.subjectName = thisSubject.subjectName;
    }
}

@end
