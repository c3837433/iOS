//
//  AddStoryViewController.m
//  Engage Your City
//
//  Created by Angela Smith on 6/20/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AddStoryViewController.h"

@interface AddStoryViewController ()

@end

@implementation AddStoryViewController
@synthesize testimonyField;



- (IBAction)saveTestimony:(id)sender {
    
    PFObject *testimony = [PFObject objectWithClassName:@"Testimonies"];
    //NSString* story = textimonyField.text;
    testimony [@"category"] = @"healing";
    testimony [@"release"] = @"NO";
    // Set the story
    [testimony setObject:[testimonyField text] forKey:@"story"];
    // Attribute it
    [testimony setObject:[PFUser currentUser] forKey:@"author"];
    
    // Set Permissions
    // Set ACL permissions for added security
    PFACL *postACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [postACL setPublicReadAccess:YES];
    [testimony setACL:postACL];
    
    // Save new Post object in Parse
    [testimony saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:@"Thanks for sharing your story with Engage!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"%@", errorString);
            //NSString* errorMessage = [NSString stringWithFormat:@"Oh this is a bummer, the %@", errorString];
            //registerErrorMessage.text = errorMessage;
            //registerErrorMessage.hidden = NO;
        }
    }];
    //[testimony saveInBackground];
    
    //testObject[@"foo"] = @"bar";
    //[testObject saveInBackground];
    //PFObject* homeGroups = [PFObject objectWithClassName:@"EngageHomeGroups"];
    // homeGroups
    // Create a new Post object and create relationship with PFUser
    
    /*PFObject *newPost = [PFObject objectWithClassName:@"Post"];
     [newPost setObject:[textView text] forKey:@"textContent"];
     [newPost setObject:[PFUser currentUser] forKey:@"author"]; // One-to-Many relationship created here!
     
     // Set ACL permissions for added security
     PFACL *postACL = [PFACL ACLWithUser:[PFUser currentUser]];
     [postACL setPublicReadAccess:YES];
     [newPost setACL:postACL];
     
     // Save new Post object in Parse
     [newPost saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
     if (!error) {
     [self dismissViewControllerAnimated:YES completion:nil]; // Dismiss the viewController upon success
     }
     }];
     */
    
}

-(IBAction)onClick:(UIButton*)button
{
    // Close view on cancel
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
