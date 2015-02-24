//
//  ViewController.h
//  Pictures
//
//  Created by Angela Smith on 6/14/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSArray* buttonLabelArray;
    NSArray* buttonImageArray;
    IBOutlet UITableView* buttonTableView;
    
}


@end
