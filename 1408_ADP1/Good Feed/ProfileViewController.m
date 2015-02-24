//
//  ProfileViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ProfileViewController.h"
#import "SettingsTableViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize authorPic, authorLocation, authorName, headerView;

#pragma mark - Parse Methods

// Parse requires initWithCoder when using storyboards
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithClassName:@"Story"];
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.parseClassName = @"Story";
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        // The number of user stories to show per page
        self.objectsPerPage = 5;
    }
    return self;
}
// Search parse for Stories to be displayed withing the table
- (PFQuery *)queryForTable {
    // If this is not the current user, do not return anythign
    if (![PFUser currentUser])
    {
        PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
        [query setLimit:0];
        return query;
    }
    // Find all stories on Parse
    PFQuery* query = [PFQuery queryWithClassName:self.parseClassName];
    // Where the current user is the author
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    [query orderByDescending:@"createdAt"];
    return query;
}


-(IBAction)navButtonClick:(UIBarButtonItem*)button
{
   // Move to Settings view
    [self performSegueWithIdentifier:@"segueToSettings" sender:button];

}

- (void)viewDidLoad
{
    // Add the background image to the view
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBg"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self updateUserProfileInfo];
    [headerView setNeedsDisplay];
}

-(void)updateUserProfileInfo
{
    PFQuery* userQuery = [PFUser query];
    [userQuery whereKey:@"username" equalTo:[[PFUser currentUser]username]];
    [userQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error)
     {
         if (object)
         {
             // set the new object data to view
             authorName.text = [object objectForKey:@"UserFullName"];
             authorLocation.text = [object objectForKey:@"UserLocation"];
             // Create a file for the image
             PFFile* imageFile = [object objectForKey:@"ProfilePicture"];
             // Set the corner radius
             authorPic.layer.cornerRadius = 8;
             // add and load the image
             authorPic.file = imageFile;
             [authorPic loadInBackground];
             // Keep it behind the cropped imageview
             authorPic.clipsToBounds = YES;
             // make sure the view is updated when it returns from the settings screen
             [headerView setNeedsDisplay];
             
         }
     }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{

    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profileStoryListCell"];
    if (cell != nil)
    {
        //cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"profileStoryListCell"];
        cell.textLabel.text = object[@"Title"];
    }
    // For now, just get the story title
    //cell.textLabel.text = object[@"Title"];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
