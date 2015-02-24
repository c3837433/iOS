//
//  LessonTBCell.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonTBCell : UITableViewCell
{
    
}
@property (strong, nonatomic) IBOutlet UILabel *courseTitle;
@property (strong, nonatomic) IBOutlet UILabel *lessonTitle;
@property (strong, nonatomic) IBOutlet UILabel *lessonSubject;
@property (strong, nonatomic) IBOutlet UILabel *lessonUnit;
@property (strong, nonatomic) IBOutlet UILabel *lessonNumber;

@end
