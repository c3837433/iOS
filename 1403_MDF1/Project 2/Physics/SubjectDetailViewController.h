//
//  SubjectDetailViewController.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhysicSubjecsCustomClass.h"

@interface SubjectDetailViewController : UIViewController
{
    // Create outlets for the data to be displayed on the Subject Detail Screen
    IBOutlet UILabel* optionTitle;
    IBOutlet UILabel* optionSubTitle;
    IBOutlet UILabel* optionSummary;
    IBOutlet UIImageView* optionImage;
}
// Create an object for for the custom class to pass to the second view
@property (nonatomic, strong) PhysicSubjecsCustomClass * currentSubject;

// return to the first view
-(IBAction)returnToSubjects:(id)sender;
@end
