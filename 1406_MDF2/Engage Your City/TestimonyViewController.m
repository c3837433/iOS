//
//  TestimonyViewController.m
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "TestimonyViewController.h"
#import <Parse/Parse.h>
@interface TestimonyViewController ()

@end

@implementation TestimonyViewController
@synthesize textimonyField;

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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"storyCell"];
    if (cell != nil) {
        //cell.textLabel.text = @"hello";
    }
    return  cell;
}


@end
