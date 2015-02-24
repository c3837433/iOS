//
//  SubjectDetailViewController.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SubjectDetailViewController.h"
#import "SubjectExampleViewController.h"

@interface SubjectDetailViewController ()

@end

@implementation SubjectDetailViewController

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
    // Display the data to the details screen
    // Set the title, subtitle, description, and image
    optionTitle.text = self.currentSubject.subjectName;
    optionSubTitle.text = self.currentSubject.subjectSubTitle;
    optionSummary.text = self.currentSubject.subjectDescription;
    optionImage.image = self.currentSubject.subjectImage;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

// return to the first view
-(IBAction)returnToSubjects:(id)sender
{
    // Dismiss the subject detail view from the stack
    [self dismissViewControllerAnimated:true completion:nil];
}

// Call the prepare for segue to move to the webview for the article
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // The destination we are moving to is the research detail view
    SubjectExampleViewController* subjectExampleVC = segue.destinationViewController;
    if (subjectExampleVC != nil) {
        // set the example label to the object example for this article
        subjectExampleVC.currentExample = self.currentSubject.subjectExample;
        // try passing the whole object over
        subjectExampleVC.thisSubject = self.currentSubject;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
