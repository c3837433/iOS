//
//  ResearchUrlWebViewController.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ResearchUrlWebViewController.h"
#import "ResearchDetailViewController.h"
@interface ResearchUrlWebViewController ()

@end

@implementation ResearchUrlWebViewController
@synthesize researchWebView, currentstring;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // set the url to the passed in string
    NSLog(@"%@", currentstring);
    NSURL * thisUrl = [[NSURL alloc] initWithString:currentstring];
    // Send teh url request
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:thisUrl];
    [self.researchWebView loadRequest:request];
    
}

// When the user wants to return to the detail screen and clicks the back button
-(IBAction)closeWebView:(id)sender
{
    // Close the web view
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
