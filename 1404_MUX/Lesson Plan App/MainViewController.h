//
//  MainViewController.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseClass.h"
#import "LessonTBCell.h"
#import "CourseInstructor.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    CourseClass* history;
    CourseClass* chemistry;
    CourseClass* literature;
    CourseClass* language;
    CourseClass* calculus;
    IBOutlet UIView* addCourse;
    IBOutlet UIView* viewLists;
    IBOutlet UITextField* newCourse;
}

@property (nonatomic, weak) IBOutlet UITableView* currentTableView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem* addCourseButton;
@property (nonatomic, weak) IBOutlet UIButton* editModeButton;
@property(nonatomic,retain) IBOutlet UISegmentedControl *segmentedSwitch;
@property (nonatomic, strong) NSMutableArray* historyCourse;
@property (nonatomic, strong) NSMutableArray* scienceCourse;
@property (nonatomic, strong) NSMutableArray* languageCourse;
@property (nonatomic, strong) NSMutableArray* mathCourse;
@property (nonatomic, strong) NSMutableArray* literatureCourse;
@property (nonatomic, strong) NSMutableArray* allLessons;
@property (nonatomic, strong) NSMutableArray* subjects;
@property (nonatomic, strong) LessonTBCell* locationCell;
@property (nonatomic, strong) NSMutableArray* allCourses;

-(IBAction)openMenu:(id)sender;
- (IBAction)addACourse:(id)sender;
@end
