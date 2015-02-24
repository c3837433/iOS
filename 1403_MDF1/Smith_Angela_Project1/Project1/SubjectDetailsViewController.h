//
//  SubjectDetailsViewController.h
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
// import the custom object class so we can pass it to the view
#import "PhysicSubjectsCustomClass.h"

@interface SubjectDetailsViewController : UIViewController
{
    // Create outlets for the data to be displayed on the second view
    IBOutlet UILabel* optionTitle;
    IBOutlet UILabel* optionSubTitle;
    IBOutlet UILabel* optionSummary;
    IBOutlet UIImageView* optionImage;
}
// Create ehe object for for the custom class to pass to the second view
@property (nonatomic, strong) PhysicSubjectsCustomClass* currentSubject;

// return to the first view
-(IBAction)returnToTable:(id)sender;
@end
