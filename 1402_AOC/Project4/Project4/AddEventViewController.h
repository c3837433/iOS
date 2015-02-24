//
//  AddEventViewController.h
//  Project4
//
//  Created by Angela Smith on 2/24/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController <UITextFieldDelegate>
{
    // Create an IBOutlet to gather the event information
    IBOutlet UITextField* eventField;
}
// add a string property to hold the new event text
@property NSString* eventNextString;
@end
