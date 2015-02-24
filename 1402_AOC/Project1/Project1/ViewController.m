//
//  ViewController.m
//  AOC 1402 Project 1
//
//  Created by Angela Smith on 2/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // CHANGE BACKGROUND COLOR
    self.view.backgroundColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    // TITLE
    // Define the label, allocate memory for it and build the label frame. * points the specific label to the UILabel class
    UILabel* labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 20.0f, 300.0f, 20.0f)];
    if (labelTitle !=nil) {
        // If the label was created add this text
        labelTitle.text = @"The Castle Corona";
        // Change the background color of label
        labelTitle.backgroundColor = [UIColor colorWithRed:0.133 green:0.243 blue:0.29 alpha:1];
        // Change the text color
        labelTitle.textColor = [UIColor colorWithRed:0.996 green:0.984 blue:0.824 alpha:1];
        // Align the text
        labelTitle.textAlignment = NSTextAlignmentCenter;
    };
    // Finally, add the label to the view
    [self.view addSubview:labelTitle];
    
    // AUTHOR
    // Define, allocate memory, and build labels for the author and author name
    UILabel* labelAuthor = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 45.0f, 125.0f, 20.0f)];
    UILabel* labelAuthorName = [[UILabel alloc] initWithFrame:CGRectMake(135.0f, 45.0f, 175.0f, 20.0f)];
    // If labels were created correctly, add text, align text, and change text and background colors
    if (labelAuthor != nil) {
        labelAuthor.text = @"Author:";
        labelAuthor.textAlignment = NSTextAlignmentRight;
        labelAuthor.textColor = [UIColor colorWithRed:0.859 green:0.953 blue:0.898 alpha:1];
        labelAuthor.backgroundColor = [UIColor colorWithRed:0.827 green:0.173 blue:0.141 alpha:1];
    }
    if (labelAuthorName != nil) {
        labelAuthorName.text = @"Sharon Creech";
        labelAuthorName.textAlignment = NSTextAlignmentLeft;
        labelAuthorName.textColor = [UIColor darkTextColor];
        labelAuthorName.backgroundColor = [UIColor colorWithRed:0.341 green:0.584 blue:0.525 alpha:1];
    }
    // Add both author labels to the view
    [self.view addSubview:labelAuthor];
    [self.view addSubview:labelAuthorName];
    
    // PUBLISHED DATE
    // Define, allocate memory, and build labels for the publisher label and name
    UILabel* labelPublished = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 70.0f, 125.0f, 20.0f)];
    UILabel* labelPubDate = [[UILabel alloc] initWithFrame:CGRectMake(135.0f, 70.0f, 175.0f, 20.0f)];
    // If created, modify label fields
    if (labelPublished != nil) {
        labelPublished.text = @"Published:";
        labelPublished.textAlignment = NSTextAlignmentRight;
        labelPublished.textColor = [UIColor colorWithRed:0.098 green:0.098 blue:0.439 alpha:1.0];
        labelPublished.backgroundColor = [UIColor colorWithRed:0.341 green:0.494 blue:0.31 alpha:1];
    }
    if (labelPubDate != nil) {
        labelPubDate.text = @"2007";
        labelPubDate.textAlignment = NSTextAlignmentLeft;
        labelPubDate.textColor = [UIColor colorWithRed:0.996 green:0.871 blue:0.89 alpha:1];
        labelPubDate.backgroundColor = [UIColor colorWithRed:0.565 green:0.302 blue:0.369 alpha:1];
    }
    // Add published labels to the view
    [self.view addSubview:labelPublished];
    [self.view addSubview:labelPubDate];
    
    // SUMMARY
    // efine, allocate memory, and build labels for the book summary and its label
    UILabel* labelSummary = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 105.0f, 125.0f, 20.0f)];
    UILabel* labelSumInfo = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 130.0f, 300.0f, 170.0f)];
    // If created, modify label and fields
    if (labelSummary != nil) {
        labelSummary.text = @"Summary";
        labelSummary.textAlignment = NSTextAlignmentLeft;
        labelSummary.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        labelSummary.backgroundColor = [UIColor brownColor];
    }
    if (labelSumInfo != nil) {
        labelSumInfo.text = @"The lives of a royal family and two orphans couldn't seem futher apart, but they connect when the children find treasure stolen from the castle. Throughout the story their lives grow closer as the royal master storyteller connects their paths and identities.";
        labelSumInfo.textAlignment = NSTextAlignmentCenter;
        // Break up the text across multiple lines
        labelSumInfo.numberOfLines = 7;
        labelSumInfo.textColor = [UIColor whiteColor];
        labelSumInfo.backgroundColor = [UIColor darkGrayColor];
    }
    // Add Summary labels to view
    [self.view addSubview:labelSummary];
    [self.view addSubview:labelSumInfo];
    
    
    //LIST OF ITEMS
    // Creates strings to hold each item in the list
    NSString* word1 = @"Royals";
    NSString* word2 = @"peasants";
    NSString* word3 = @"Wordsmith";
    NSString* word4 = @"Hermit";
    NSString* word5 = @"medallions";
    // Build an array with each of the list strings, stop at five with nil
    NSArray* wordList = [NSArray arrayWithObjects:word1, word2, word3, word4, word5, nil];
    //NSLog(@"%@",[wordList description]);
    // Define, allocate and initialize a mutable string to combine the items into
    NSMutableString * listString = [[NSMutableString alloc] init];
    // Create an integer to hold the loop index value
    NSUInteger index = 0;
    // Loop through each word in the array
    for (NSString *word in wordList)
    {
        // Add each word to the string
        [listString appendString:(NSString *)word];
        // after adding the word, raise the index up by one
        index++;
        // If the count is at 1-3, add a comma to the current string
        if (index < 4 )
        {
            [listString appendString:@", "];
        }
        // If the loop is on the fourth word, add the comma with the word "and" to prepare for the final string
        else if (index == 4)
        {
            [listString appendString:@", and "];
        }
        // Finally after adding the last word add a period to the end of the string
        else if (index == 5)
        {
            [listString appendString:@"."];
        }
    }
    // Print out the final string to the console
    NSLog(@"%@",listString);
    
    // Add the LIST OF ITEMS to the View
    // Allocate list label and field to hold list
    UILabel* labelList = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 305.0f, 125.0f, 20.0f)];
    UILabel* labelListString = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 330.0f, 300.0f, 50.0f)];
    // Check to make sure label was created, if so add text and make changes
    if (labelList != nil) {
        labelList.text = @"List of items:";
        labelList.textColor = [UIColor colorWithRed:0.086 green:0.125 blue:0.318 alpha:1];
        labelList.backgroundColor = [UIColor colorWithRed:0.898 green:0.616 blue:0.216 alpha:1];
    }
    if (labelListString != nil) {
        labelListString.text = listString;
        labelListString.textColor = [UIColor blackColor];
        // Have the string wrap over the lines
        labelListString.numberOfLines = 2;
        // Center the text
        labelListString.textAlignment = NSTextAlignmentCenter;
        labelListString.backgroundColor = [UIColor colorWithRed:0.663 green:0.129 blue:0.176 alpha:1];
    }
    // Add the liat of items labels to the view
    [self.view addSubview:labelList];
    [self.view addSubview:labelListString];
    // END
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
