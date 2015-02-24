//
//  LogInViewController.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField* usernameField;
    IBOutlet UITextField* passwordField;
    IBOutlet UIView* tourInfoView;
    IBOutlet UIBarButtonItem* tourNextButton;
}
@property (nonatomic) BOOL hasSeenTour;
- (IBAction)onClick:(id)sender;
-(IBAction)closeTour:(id)sender;
- (IBAction)switchViews:(UIStoryboardSegue *)segue;

-(void)closeKeyboard;

@end
