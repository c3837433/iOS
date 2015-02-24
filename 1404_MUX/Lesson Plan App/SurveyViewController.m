//
//  SurveyViewController.m
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SurveyViewController.h"

@interface SurveyViewController ()

@end

@implementation SurveyViewController
@synthesize surveyWebView;

- (void)viewDidLoad
{
    // Create the loading image
    UIActivityIndicatorView* loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loadingIndicator.center = self.view.center;
    // Start and display the loading
    [loadingIndicator startAnimating];
    [self.view addSubview:loadingIndicator];
    
    
    // Change the color of the title to white
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // Set up the url request
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [surveyWebView reload];
    NSURL * thisUrl = [[NSURL alloc] initWithString:@"https://docs.google.com/forms/d/1WRy9hk7mDM9FdGeD4SBUv0pavbe_3YhaJHC-TRJ4xnQ/viewform"];
    // Send the url request
    request = [[NSURLRequest alloc] initWithURL:thisUrl];
    if (request != nil)
    {
        // Scale the page to fit in the webview
        surveyWebView.scalesPageToFit = true;
        //load the request into the webview
        [surveyWebView loadRequest:request];
        [surveyWebView reload];
    }
    // stop the loader
    [loadingIndicator stopAnimating];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
