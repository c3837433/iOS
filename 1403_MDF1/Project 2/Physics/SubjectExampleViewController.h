//
//  SubjectExampleViewController.h
//  Physics
//
//  Created by Angela Smith on 3/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
// import the custom class
#import "PhysicSubjecsCustomClass.h"
@interface SubjectExampleViewController : UIViewController
{
    // create an outlet for the example label
    IBOutlet UILabel* example;
    IBOutlet UIBarButtonItem* formulaLink;
}
// create a property string to hold the label text
@property (nonatomic, strong) NSString* currentExample;
@property (nonatomic, strong) PhysicSubjecsCustomClass * thisSubject;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* formulaLink;
@end
