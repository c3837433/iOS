//
//  SubjectViewController.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubjectViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>
{
    // Create an outlet for the tableView to hold the new objects
    IBOutlet UITableView* physicSubjectTableView;
    // Define an array to hold the table view data
    NSMutableArray* physicSubjectArray;
    NSMutableArray* researchArticlesArray;
}

@end
