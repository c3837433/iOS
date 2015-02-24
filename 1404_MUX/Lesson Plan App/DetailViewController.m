//
//  DetailViewController.m
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "DetailViewController.h"
#import "firstDetailCell.h"
#import "secondDetailCell.h"
#import "thirdDetailCell.h"
#import "fourthDetailCell.h"
#import "CourseInstructor.h"


@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize currentLesson, segmentNumber, currentCourse;

- (void)viewDidLoad
{
    // Change the color of the title to white
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    labelInfo.userInteractionEnabled = FALSE;
    // check which segment was sent over
    if (segmentNumber == 0) {
        self.title = currentCourse.courseSubject;
        // remove the lesson button
        //completeButton.hidden = YES;
        
    } else {
        self.title = currentLesson.subject;
        //completeButton.hidden = NO;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

// TABLEVIEW REQUIRED METHOD 1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Make the separators the same color as the segmented control
    tableView.separatorColor = [UIColor colorWithHue:0.19 saturation:0.57 brightness:0.67 alpha:1];
    return 4;
}

// TABLEVIEW REQUIRED METHOD 2
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Make the separators the same color as the segmented control
    tableView.separatorColor = [UIColor colorWithHue:0.57 saturation:0.69 brightness:0.6 alpha:1];
    
    // Configure the cells
    UITableViewCell* locationCell;
    // Check the cell
    if (indexPath.section == 0) {
    // check the cell row
        if(indexPath.row == 0) {
            // This is the first cell
            firstDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
            // Check with segment sent the cell over
            if (segmentNumber == 0) {
                // this is the for course times
                cell.firstLabel.text = @"Course Meets";
                cell.firstInfo.text = @"MWF 1:45 - 3:00";
            } else if (segmentNumber == 1) {
                // this is the lesson detail tableview
                cell.firstLabel.text = @"Lesson";
                cell.firstInfo.text = [NSString stringWithFormat:@"Unit: %@  Lesson: %@", currentLesson.unit, currentLesson.number];
            }
            locationCell = cell;
            //return cell;
        } else if (indexPath.row == 1)  {
            secondDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
            // Check with segment sent the cell over
            if (segmentNumber == 0) {
                // this is the Course instructor
                cell.secondLabel.text = @"Instructor";
                cell.secondInfo.text = currentCourse.courseInstructor.instructorName;
                [cell.instructorEmail setTitle:currentCourse.courseInstructor.instructorEmail forState:UIControlStateNormal];
                [cell.instructorPhone setTitle:currentCourse.courseInstructor.instructorPhone forState:UIControlStateNormal];
            } else if (segmentNumber == 1) {
                // this is the lesson detail tableview
                cell.secondLabel.text = @"Subject";
                cell.secondInfo.text = currentLesson.title;
                // remove the email and phone number buttons
                cell.instructorEmail = nil;
                cell.instructorPhone = nil;
            }
            locationCell = cell;
            //return cell;
        } else if (indexPath.row == 2)  {
            thirdDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
            // Check with segment sent the cell over
            if (segmentNumber == 0) {
                // this is the Course resources
                cell.thirdLabel.text = @"Resources";
                cell.thirdInfo.text = currentCourse.courseResources.description;
            } else if (segmentNumber == 1) {
                // this is the lesson detail tableview
                cell.thirdLabel.text = @"Resource";
                cell.thirdInfo.text = currentLesson.resource;
            }
            locationCell = cell;
            //return cell;
        } else  {
            fourthDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:@"fourthCell"];
            // Check with segment sent the cell over
            if (segmentNumber == 0) {
                // this is the Course syllabus
                cell.infoLabel.text = @"Syllabus";
                cell.infoTextview.text = currentCourse.courseSyllabus;
            } else if (segmentNumber == 1) {
                // this is the lesson detail tableview
                cell.infoLabel.text = @"Information";
                cell.infoTextview.text = currentLesson.info;
            }
            locationCell = cell;
            //return cell;
        }
    }
    return locationCell;
}
// Set the height of each cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath  *)indexPath{
    
    int height;
    // Change cell heights based on cell info
    switch(indexPath.row) {
        case 0: // First Cell
        {
            height = 60;
            break;
        }
        case 1:
        {
            if (segmentNumber == 0) {
                // This is the second cell (instructor info) on the course detail
                height = 100;
            } else {
                height = 70;
            }
            break;
        }
        case 2: // Third Cell
        {
            height = 80;
            break;
        }
        case 3: // Fourth Cell
        {
            height= 255;
        }
    }
    return height;
}

// Segue to menu
-(IBAction)openMenu:(id)sender
{
}

// Change the image when the user marks it as complete
-(IBAction)changeLessonStatus:(id)sender
{
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"checkEmpty.png"] forState:UIControlStateNormal];
        currentLesson.completed = NO;
        // Set the bool to no, the lesson is not completed
        
        [sender setSelected:NO];
    } else {
        [sender setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateSelected];
        [sender setSelected:YES];
        // Set the bool value to yes
        currentLesson.completed = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
