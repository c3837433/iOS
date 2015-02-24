//
//  MainViewController.m
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "MainViewController.h"
#import "CourseClass.h"
#import "LessonClass.h"
#import "LessonTBCell.h"
#import "DetailViewController.h"
#import "CourseInstructor.h"
#import "MenuViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize segmentedSwitch, historyCourse, mathCourse, languageCourse, scienceCourse, literatureCourse, allLessons, subjects, locationCell, allCourses, currentTableView, addCourseButton, editModeButton;
- (void)viewDidLoad
{
    // APPEARANCE CHANGES
    // Change the color of the title to white
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    // Remove the back button
    [self.navigationItem setHidesBackButton:YES animated:YES];
    // Change the segmented control color
    segmentedSwitch.tintColor = [UIColor colorWithHue:0.59 saturation:0.94 brightness:0.97 alpha:1];
    
    // Create the course objects
    LessonClass* lesson1 = [[LessonClass alloc] init];
    lesson1.subject = @"History";
    lesson1.title = @"The Declaration of Independence";
    lesson1.unit = @"12";
    lesson1.number = @"4";
    lesson1.resource = @"The World of History p. 123 - 146";
    lesson1.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson1.completed = NO;
    
    LessonClass* lesson2 = [[LessonClass alloc] init];
    lesson2.subject = @"History";
    lesson2.title = @"The Alliance with France";
    lesson2.unit = @"12";
    lesson2.number = @"5";
    lesson2.resource = @"The World of History p. 147 - 169";
    lesson2.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson2.completed = NO;
    
    LessonClass* lesson3 = [[LessonClass alloc] init];
    lesson3.subject = @"Chemistry";
    lesson3.title = @"Hydrocarbons";
    lesson3.unit = @"12";
    lesson3.number = @"4";
    lesson3.resource = @"The World of Chemistry p. 17 - 26";
    lesson3.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson3.completed = NO;
    
    LessonClass* lesson4 = [[LessonClass alloc] init];
    lesson4.subject = @"Chemistry";
    lesson4.title = @"Saturated and Unsaturated Hydrocarbons";
    lesson4.unit = @"12";
    lesson4.number = @"5";
    lesson4.resource = @"The World of Chemistry p. 27 - 36";
    lesson4.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson4.completed = NO;
    
    LessonClass* lesson5 = [[LessonClass alloc] init];
    lesson5.subject = @"Literature";
    lesson5.title = @"Conflict with Man";
    lesson5.unit = @"12";
    lesson5.number = @"4";
    lesson5.resource = @"Pride and Prejudice p. 147 - 172";
    lesson5.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson5.completed = NO;
    
    LessonClass* lesson6 = [[LessonClass alloc] init];
    lesson6.subject = @"Literature";
    lesson6.title = @"Conflict with Self";
    lesson6.unit = @"12";
    lesson6.number = @"5";
    lesson6.resource = @"Pride and Prejudice p. 173 - 198";
    lesson6.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson6.completed = NO;
    
    LessonClass* lesson7 = [[LessonClass alloc] init];
    lesson7.subject = @"Grammar & Composition";
    lesson7.title = @"Transitive and Intransitive Verbs";
    lesson7.unit = @"12";
    lesson7.number = @"4";
    lesson7.resource = @"The Art of Grammar p. 154 - 159";
    lesson7.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson7.completed = NO;
    
    LessonClass* lesson8 = [[LessonClass alloc] init];
    lesson8.subject = @"Grammar & Composition";
    lesson8.title = @"Understanding an Argumentative Essay";
    lesson8.unit = @"12";
    lesson8.number = @"5";
    lesson8.resource = @"Communicating Effectively p. 213 - 221";
    lesson8.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson8.completed = NO;
    
    LessonClass* lesson9 = [[LessonClass alloc] init];
    lesson9.subject = @"Calculus";
    lesson9.title = @"Continuity in Limits";
    lesson9.unit = @"12";
    lesson9.number = @"4";
    lesson9.resource = @"Calculus in Application p. 143 - 147";
    lesson9.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson9.completed = NO;
    
    LessonClass* lesson10 = [[LessonClass alloc] init];
    lesson10.subject = @"Calculus";
    lesson10.title = @"Derivatives";
    lesson10.unit = @"12";
    lesson10.number = @"5";
    lesson10.resource = @"Calculus in Application p. 148 - 152";
    lesson10.info = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    lesson10.completed = NO;
    
    allLessons = [[NSMutableArray alloc] initWithObjects:lesson1, lesson2, lesson3, lesson4, lesson5, lesson6, lesson7, lesson8, lesson9, lesson10, nil];
    
    // Loop through all the lessens and create a class object for each individual class
    for (LessonClass*lesson in allLessons) {
        CourseInstructor* instructor = [[CourseInstructor alloc] init];
        if ([lesson.subject isEqualToString:@"History"]) {
            // Create a history class
            history = [[CourseClass alloc] init];
            history.courseSubject = lesson.subject;
            instructor.instructorName = @"Professor Lucille Moore";
            instructor.instructorEmail = @"LMoore@educate.edu";
            instructor.instructorPhone = @"(800) 555 - 1234";
            history.courseInstructor = instructor;
            history.courseSyllabus = @"";
            history.courseResources = @"The World of History";
            // Add the lesson to the history course
            [history.lessons addObject:lesson];
            // Add the history lesson to the history course
            [historyCourse addObject:lesson];
        } else if ([lesson.subject isEqualToString:@"Chemistry"]) {
            // Create a chemistry class
            chemistry = [[CourseClass alloc] init];
            chemistry.courseSubject = lesson.subject;
            instructor.instructorName = @"Professor Edwin Richardson";
            instructor.instructorEmail = @"ERichardson@educate.edu";
            instructor.instructorPhone = @"(800) 555 - 1234";
            chemistry.courseInstructor = instructor;
            chemistry.courseSyllabus = @"Unit 1: Introduction to Chemistry and Matter Unit 2: Atoms\nUnit 2: Atoms\nUnit 3: Nuclear Reactions\nUnit 4: Elements and the Periodic Law\nUnit 5: Compounds and Formula Nomenclature\nUnit 6: Chemical Reactions\nUnit 7: Stoichiometry\nUnit 8: Physical States of Mater\nUnit 9: Water and Solutions\nUnit 10: Acids and Bases\nUnit 11: Gases\nUnit 12: Hydrocarbons";
            chemistry.courseResources = @"The World of Chemistry";
            [chemistry.lessons addObject:lesson];
            [scienceCourse addObject:lesson];
        } else if ([lesson.subject isEqualToString:@"Literature"]) {
            literature = [[CourseClass alloc] init];
            literature.courseSubject = lesson.subject;
            instructor.instructorName = @"Professor Whitney Reynolds";
            instructor.instructorEmail = @"WReynolds@educate.edu";
            instructor.instructorPhone = @"(800) 555 - 1234";
            literature.courseInstructor = instructor;
            literature.courseSyllabus = @"";
            literature.courseResources = @"Pride and Prejudice";
            [literature.lessons addObject:lesson];
            [literatureCourse addObject:lesson];
        } else if ([lesson.subject isEqualToString:@"Grammar & Composition"]) {
            language = [[CourseClass alloc] init];
            language.courseSubject = lesson.subject;
            instructor.instructorName = @"Professor Marco Collier";
            instructor.instructorEmail = @"MCollier@educate.edu";
            instructor.instructorPhone = @"(800) 555 - 1234";
            language.courseInstructor = instructor;
            language.courseSyllabus = @"";
            language.courseResources = @"Communicating Effectively\nThe Art of Grammar";
            [language.lessons addObject:lesson];
            [languageCourse addObject:lesson];
        } else if ([lesson.subject isEqualToString:@"Calculus"]) {
            calculus = [[CourseClass alloc] init];
            calculus.courseSubject = lesson.subject;
            instructor.instructorName = @"Samuel Evans";
            instructor.instructorEmail = @"SEvans@educate.edu";
            instructor.instructorPhone = @"(800) 555 - 1234";
            calculus.courseInstructor = instructor;
            calculus.courseSyllabus = @"";
            calculus.courseResources = @"Calculus in Application";
            [calculus.lessons addObject:lesson];
            [mathCourse addObject:lesson];
        }
        // Save all the course objects in an array
        allCourses = [[NSMutableArray alloc] initWithObjects:history, chemistry, literature,language,calculus, nil ];
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// RELOAD TABLE
- (IBAction)changeTableData:(id)sender {
    [currentTableView reloadData];
}

// TABLEVIEW REQUIRED METHOD 1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Make the separators the same color as the segmented control
    tableView.separatorColor = [UIColor colorWithHue:0.57 saturation:0.69 brightness:0.6 alpha:1];
    
    // Set the tableview with the right array when the segments change
    NSMutableArray* currentArray;
    if (segmentedSwitch.selectedSegmentIndex == 0)
        // this is the courses tableview
    {
        currentArray = allCourses;
        
    } else if (segmentedSwitch.selectedSegmentIndex == 1)
        // This is the schedule tableview
    {
        currentArray = allLessons;
    }
    // set the number of table cells equal to the number of items in the  correct array
    return currentArray.count;
}

// TABLEVIEW REQUIRED METHOD 2
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    locationCell = [tableView dequeueReusableCellWithIdentifier:@"lessonList" forIndexPath:indexPath];
    if (segmentedSwitch.selectedSegmentIndex == 0) {
        // COURSES SEGMENT
        NSLog(@"%@", allCourses.description);
        
        if (locationCell != nil) {
            CourseClass* thisCourse = [allCourses objectAtIndex:indexPath.row];
            // refresh the cell with the data from the custom location object
            locationCell.courseTitle.text = thisCourse.courseSubject;
            locationCell.lessonTitle.text = nil;
            locationCell.lessonSubject.text = nil;
            locationCell.lessonUnit.text = nil;
            locationCell.lessonNumber.text = nil;
        }
        
    } else if (segmentedSwitch.selectedSegmentIndex == 1)
        // LESSONS SEGMENT
    {
        if (locationCell != nil) {
            
            LessonClass* thisLesson = [allLessons objectAtIndex:indexPath.row];
            // sort the list view by lesson numbers so current ones are on top
            [self.allLessons sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES]]];
            
            // refresh the cell with the data from the custom location object
            locationCell.lessonTitle.text = thisLesson.title;
            locationCell.lessonSubject.text = thisLesson.subject;
            locationCell.lessonUnit.text = [NSString stringWithFormat:@"Unit: %@",thisLesson.unit];
            locationCell.lessonNumber.text = [NSString stringWithFormat:@"Lesson: %@", thisLesson.number];
            locationCell.courseTitle.text = nil;
        }
    }
    // Edit/Delete swipe gesture
    /*UISwipeGestureRecognizer *gestureR = [[UISwipeGestureRecognizer alloc]
                                          init];
    [locationCell addGestureRecognizer:gestureR];
    */
     return locationCell;
}

// PASS DATA TO DETAIL VIEW
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toDetailView"]) {
    // The destination we are moving to is the SubjectDetailsVC
    DetailViewController* detailVC = segue.destinationViewController;
    if (segmentedSwitch.selectedSegmentIndex == 0) {
        //currentArray = unit11;
        
        if (detailVC != nil) {
            UITableViewCell* currentCell = (UITableViewCell*)sender;
            NSIndexPath* indexPath = [currentTableView indexPathForCell:currentCell];
            // Pass the correct array to the detail view controller
            CourseClass* thisCourse = [allCourses objectAtIndex:indexPath.row];

            detailVC.currentCourse = thisCourse;
            //detailVC.courseTitle = thisCourse.courseSubject;
            detailVC.segmentNumber = segmentedSwitch.selectedSegmentIndex;
            
        }
    } else if (segmentedSwitch.selectedSegmentIndex == 1){
        NSMutableArray* currentArray = allLessons;
        // The destination we are moving to is the SubjectDetailsVC
        if (detailVC != nil) {
            // Cast the sender to a UITableViewCell
            LessonTBCell* lessonCell = (LessonTBCell*)sender;
            // set the index path to the lesson cell that sent it over
            NSIndexPath* indexPath = [currentTableView indexPathForCell:lessonCell];
            
            // Implement the class object so that the rows contain the objects
            LessonClass* thisLesson = [currentArray objectAtIndex:indexPath.row];
            // Set the current subject to the one passed to the view
            detailVC.currentLesson = thisLesson;
            // Pass the segment index so we can set the right text in the detail view
            detailVC.segmentNumber = segmentedSwitch.selectedSegmentIndex;
        }
    }
    } 
    
}
// Set the cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath  *)indexPath{
    // if it is the courses segment
    if (segmentedSwitch.selectedSegmentIndex == 0) {
        return 50;
    }
    // the lesson segment
    return 60;
}

// Once the table view is in editing mode, if an item is deleted modify the table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray* currentArray;
    if (segmentedSwitch.selectedSegmentIndex == 0) {
        currentArray = allCourses;
    } else if (segmentedSwitch.selectedSegmentIndex == 1)
    {
        currentArray = allLessons;
    }
    
    // This gets called when the Edit button is pressed
    // check to see if we are in editing mode
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // remove the object from the array of data that is feeding the table view
        [currentArray removeObjectAtIndex:indexPath.row];
        // remove the line from the table view
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}
// Create an IBAction to listed for the edit button to turn editing mode on
-(IBAction)onClick
{
    // Turn editing mode on by toggling .editing from normal to delete mode
    currentTableView.editing = !currentTableView.isEditing;
}

-(IBAction)openMenu:(id)sender
{

}

- (IBAction)addACourse:(id)sender {
    // Create new buttons to change from add to cancel, set their tags and change them to white
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addACourse:) ];
    [addButton setTag:0];
    [addButton setTintColor:[UIColor whiteColor]];
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(addACourse:)];
    [cancelButton setTag:4];
    [cancelButton setTintColor:[UIColor whiteColor]];
    switch (((UIButton *)sender).tag) {
        case 0:
            // display view
            addCourse.Hidden = NO;
            viewLists.Hidden = YES;
            //currentTableView.Hidden = YES;
            newCourse.text = @"";
            addCourseButton.style = UIBarButtonSystemItemCancel;
            // change the button from add to cancel
            self.navigationItem.leftBarButtonItem = cancelButton;
            break;
            
        case 1:
            if (![newCourse.text  isEqual: @""]) {
                NSString* newCourseName = newCourse.text;
                CourseClass* course = [[CourseClass alloc] init];
                course.courseSubject = newCourseName;
                [allCourses addObject:course];
                
            }
            // display view
            [newCourse resignFirstResponder];
            addCourse.Hidden = YES;
            //currentTableView.Hidden = NO;
            viewLists.Hidden = NO;
            //((UIButton *)sender).tag = 0;
            [currentTableView reloadData];
            addCourseButton.style = UIBarButtonSystemItemAdd;
            // change the button from cancel back to add
            self.navigationItem.leftBarButtonItem = addButton;
            break;
            
        case 4:
            // close the view without saving
            viewLists.hidden = NO;
            addCourse.hidden = YES;
            
            //((UIButton *)sender).tag = 0;
            addCourseButton.style = UIBarButtonSystemItemAdd;
            // change the button from cancel back to add
            self.navigationItem.leftBarButtonItem = addButton;
            break;
        default:
            break;
    }
}

// Create an IBAction to listed for the edit button to turn editing mode on
-(IBAction)deleteOnClick
{
    // Set the edit button text based on whether we are in editing mode or not
    if (currentTableView.isEditing) {
        [editModeButton setTitle:@"Edit" forState:UIControlStateNormal];
    } else {
        [editModeButton setTitle:@"Done" forState:UIControlStateNormal];
    }
    // Turn editing mode on by toggling editing from normal to delete mode
    currentTableView.editing = !currentTableView.isEditing;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
