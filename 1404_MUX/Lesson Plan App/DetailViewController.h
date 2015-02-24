//
//  DetailViewController.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LessonClass.h"
#import "CourseClass.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UILabel* labelResource;
    IBOutlet UITextView* labelInfo;
    IBOutlet UILabel* labelTitle;
    IBOutlet UILabel* labelUnit;
    IBOutlet UILabel* labelNumber;
}
@property (nonatomic, strong) LessonClass* currentLesson;
@property (nonatomic, strong) CourseClass* currentCourse;
@property (nonatomic, strong) NSMutableArray* coursesArray;
@property (nonatomic) int segmentNumber;
@property (nonatomic, weak) IBOutlet UITableView* detailTableView;

-(IBAction)openMenu:(id)sender;
-(IBAction)changeLessonStatus:(id)sender;

@end
