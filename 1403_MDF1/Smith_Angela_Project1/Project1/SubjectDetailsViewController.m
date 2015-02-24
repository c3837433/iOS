//
//  SubjectDetailsViewController.m
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SubjectDetailsViewController.h"

@interface SubjectDetailsViewController ()

@end

@implementation SubjectDetailsViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    // Display the data to the details screen
    // Set the title, subtitle, description, and image
    optionTitle.text = self.currentSubject.subjectName;
    optionSubTitle.text = self.currentSubject.subjectSubTitle;
    optionSummary.text = self.currentSubject.subjectDescription;
    optionImage.image = self.currentSubject.subjectImage;
}

// return to the first view
-(IBAction)returnToTable:(id)sender
{
    // Dismiss the second view controller
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
