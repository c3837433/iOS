//
//  ViewController.h
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    // Create an outlet for the tableView to hold the new objects
    IBOutlet UITableView* physicSubjectTableView;
    // Define an array to hold the table view data
    NSMutableArray* physicSubjectArray;
}

// Create an IBAction to listed for the edit button to turn editing mode on
-(IBAction)onClick;

@end
