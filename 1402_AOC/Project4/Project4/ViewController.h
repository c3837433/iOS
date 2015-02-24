//
//  ViewController.h
//  Project4
//
//  Created by Angela Smith on 2/24/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    // create the outlet that will contain the captured event data
    IBOutlet UITextView *eventDataField;
    // define a string that will hold each new event
    NSString* newString;
    // define a sutable string that will receive the appended events
    NSMutableString* newEventString;
}
@end
