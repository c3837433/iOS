//
//  ViewController.m
//  Physics
//
//  Created by Angela Smith on 3/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
// Import the custom object
#import "BranchesCustomClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{    
    // Build the custom object for the branches page
    BranchesCustomClass* branch = [[BranchesCustomClass alloc] init];
    branch.branchTitle = @"Branches of Physics";
    branch.branchIntro = @"Elementary Physics gives a brief introduction to the study of how matter relates to motion, energy and force within the branches of Classical Mechanics, Thermodynamics, and Electromagnetism.";
    branch.firstbranch = @"Classical Mechanics is the study of the motion of objects as they relate to Sir Isaac Newton's laws of Mechanics. Some of the subject areas include gravity, motion and work.";
    branch.secondBranch = @"Thermodynamics is the branch of physical science that looks at how heat relates to energy and work.";
    branch.thirdBranch = @"Electromagnetism looks at the study of electronics and magnetism. The electromagnetic force is one of the four fundamental forces, in which all other forces come from.";
    
    branchTitle.text = branch.branchTitle;
    branchIntro.text = branch.branchIntro;
    branch1.text = branch.firstbranch;
    branch2.text = branch.secondBranch;
    branch3.text = branch.thirdBranch;
    [super viewDidLoad];
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
