//
//  ViewController.h
//  In Theatres
//
//  Created by Angela Smith on 6/19/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView* movieListingsTableview;
    NSArray* theatresArray;
    IBOutlet UITableView* movieTableView;
}
@end
