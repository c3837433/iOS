//
//  ViewController.h
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView* actionsTableView;
    IBOutlet UITextView* messageTextView;
    IBOutlet UILabel* messageTitle;
    IBOutlet UIImageView* bgImage;
}

- (IBAction)logOutButtonTapAction:(id)sender;
@end
