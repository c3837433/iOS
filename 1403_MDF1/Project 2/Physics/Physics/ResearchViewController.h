//
//  ResearchViewController.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    // Create an outlet for the tableView to hold the new objects
    IBOutlet UITableView* researchTableView;
    // Define an array to hold the table view data
    NSMutableArray* researchArticlesArray;
}

@end
