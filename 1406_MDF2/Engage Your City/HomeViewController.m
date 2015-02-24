//
//  HomeViewController.m
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "CustomTestimonyObject.h"

@interface HomeViewController ()

@end

@implementation HomeViewController



- (void)viewDidLoad
{
    PFQuery *query = [PFQuery queryWithClassName:@"Testimonies"];
    [query whereKey:@"release" equalTo:@"YES"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d testimonies.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                //Create objects
                //CustomTestimonyObject* storyObject = [[CustomTestimonyObject alloc]init];
                //storyObject.storyDate =
               // storyObject.storyText = object[@"story"];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

    // Do any additional setup after loading the view.
}


-(void)rotateReviews:(NSTimer *)timer
{
    // Create an integer for the index value
    //NSInteger i = [timer.userInfo integerValue];
    // When the number is equal to the array index
    /*if (i >= self.thisLocation.locationReviews.count) {
        return;
    }
    // Reset the label with the current index revew
    locationReview.text = [NSString stringWithFormat:@"%@", self.thisLocation.locationReviews[i]];
    // Restart the timer and increase theinteger value
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(rotateReviews:) userInfo:@(i+1) repeats:NO];
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
