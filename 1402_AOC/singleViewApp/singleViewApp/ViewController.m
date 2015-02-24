//
//  ViewController.m
//  singleViewApp
//
//  Created by Angela Smith on 2/3/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor cyanColor];
    // Allocate the ui label (created int he header file) that is 20X200 and place it at 20, 20
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 200.0f, 20.0f)];
    if (label1 != nil)
    {
        // If the label was created, add this text
        label1.backgroundColor = [UIColor redColor];
        // Then change the background color so I see the label
        label1.text = @"This is my text label!";
        // Change the text alignment to center
        label1.textAlignment = NSTextAlignmentCenter;
    };
    // Add the label to the screen
    [self.view addSubview:label1];
    
    // Allocate the second label
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 50.0f, 200.0f, 20.0f)];
    
    if (label2 != nil) {
        // If the label was successfully created, add text, change bg color and allignment
        label2.backgroundColor = [UIColor yellowColor];
        label2.text = @"This is the second label!";
        label2.textAlignment = NSTextAlignmentLeft;
    }
    // Add the label to the UI
    [self.view addSubview:label2];
    
    
    // Working with LONG labels
    // Allocate the long label
    longLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 250.0f, 250.0f, 100.0f)];
    
    if (longLabel != nil) {
        longLabel.backgroundColor = [UIColor lightGrayColor];
        longLabel.text = @"Now is the time for all good men to come to the aid of their land.";
        // Change the number of lines so text wraps sections.
        longLabel.numberOfLines = 3;
        // Change the color of the text
        longLabel.textColor = [UIColor whiteColor];
    }
    
    // Add the label to the UI
    [self.view addSubview:longLabel];
    
    // COLORS
    // ICe Blue [UIColor colorWithRed:0.859 green:0.953 blue:0.898 alpha:1] /*#dbf3e5*/
    //Light charcoal [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1] /*#2e2e2e*/
    // Dark teal [UIColor colorWithRed:0.133 green:0.243 blue:0.29 alpha:1] /*#223e4a*/
    // Greyish teal [UIColor colorWithRed:0.341 green:0.584 blue:0.525 alpha:1] /*#579586*/
    // Light army green [UIColor colorWithRed:0.341 green:0.494 blue:0.31 alpha:1] /*#577e4f*/
    // Red w/ hint of magenta [UIColor colorWithRed:0.663 green:0.129 blue:0.176 alpha:1] /*#a9212d*/
    // Red with hint of orange [UIColor colorWithRed:0.827 green:0.173 blue:0.141 alpha:1] /*#d32c24*/
    // Deep burgundy [UIColor colorWithRed:0.329 green:0.067 blue:0.102 alpha:1] /*#54111a*/
    // Mustard orange [UIColor colorWithRed:0.898 green:0.616 blue:0.216 alpha:1] /*#e59d37*/
    // Beige [UIColor colorWithRed:0.996 green:0.984 blue:0.824 alpha:1] /*#fefbd2*/
    // Charcoal [UIColor colorWithRed:0 green:0.145 blue:0.145 alpha:1] /*#0#2525*/
    // Dark blue [UIColor colorWithRed:0.086 green:0.125 blue:0.318 alpha:1] /*#162051*/
    // Purple [UIColor colorWithRed:0.49 green:0.173 blue:0.392 alpha:1] /*#7d2c64*/
    // Mauve [UIColor colorWithRed:0.565 green:0.302 blue:0.369 alpha:1] /*#904d5e*/
    // Peach [UIColor colorWithRed:0.996 green:0.871 blue:0.89 alpha:1] /*#fedee3*/
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
