//
//  HomeGroupsViewController.m
//  Engage Your City
//
//  Created by Angela Smith on 6/20/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "HomeGroupsViewController.h"

@interface HomeGroupsViewController ()

@end

@implementation HomeGroupsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"homeGroupCell"];
    if (cell != nil) {
        //cell.textLabel.text = @"hello";
    }
    return cell;
}

-(IBAction)onClick:(UIButton*)button
{
    // Close view on cancel
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
