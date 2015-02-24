//
//  SettingsTableViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLEVIEW DATA SOURCE METHODS
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return  1;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Change the color of the header text in each section
    if([view isKindOfClass:[UITableViewHeaderFooterView class]]){
        UITableViewHeaderFooterView *tableViewHeaderFooterView = (UITableViewHeaderFooterView *) view;
        tableViewHeaderFooterView.textLabel.textColor = [UIColor colorWithRed:0.07 green:0.57 blue:0.76 alpha:1];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // the second section allows the user to log out
   if (indexPath.section == 1)
    {
        // log out the user
        [self logOutUser];
    }
}




-(void)logOutUser
{
    // Clear created NSUserDefaults
    [userDefaults removeObjectForKey:@"sharePermission"];
    [userDefaults removeObjectForKey:@"FBLinkable"];
    [userDefaults synchronize];
    
    // Log out of parse
    [PFUser logOut];
    
    // Move back to log in screen
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController* mainNavControl = [storyboard instantiateViewControllerWithIdentifier:@"launchNavController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:mainNavControl];
}

@end
