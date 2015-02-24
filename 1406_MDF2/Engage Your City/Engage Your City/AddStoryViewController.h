//
//  AddStoryViewController.h
//  Engage Your City
//
//  Created by Angela Smith on 6/20/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AddStoryViewController : UIViewController
{

}
@property (nonatomic, strong) IBOutlet UITextView* testimonyField;
- (IBAction)saveTestimony:(id)sender;
@end
