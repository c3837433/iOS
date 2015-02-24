//
//  GoodFeedViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/12/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "GoodFeedViewController.h"

@interface GoodFeedViewController ()

@end

@implementation GoodFeedViewController

#pragma mark - Parse Methods
// Storyboard init
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
    [query orderByDescending:@"createdAt"];
    return query;
}


- (void)viewDidLoad
{
    // Add background image
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MainBg"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    // Create a testing cell
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testTextCell"];
    if (cell != nil)
    {
        // Set the title in the label
        cell.textLabel.text = object[@"Title"];
    }
    return cell;
}

@end
