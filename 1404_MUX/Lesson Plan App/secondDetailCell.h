//
//  secondDetailCell.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondDetailCell : UITableViewCell
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;
@property (strong, nonatomic) IBOutlet UITextView *secondInfo;
@property (strong, nonatomic) IBOutlet UIButton* instructorEmail;
@property (strong, nonatomic) IBOutlet UIButton* instructorPhone;
@end
