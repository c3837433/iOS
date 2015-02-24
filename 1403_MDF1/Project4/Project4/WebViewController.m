//
//  WebViewController.m
//  Project4
//
//  Created by Angela Smith on 3/21/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "WebViewController.h"
#import "AppDelegate.h"
//#import "UITabBarController.h"
@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad
{
    // TAB BAR APPEARANCE
    // Create the tabbar image and change the background to an orange gradient
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabBarBg.png"];

    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    

    
    // Create the url
    NSURL* webViewUrl = [[NSURL alloc] initWithString:@"http:www.upworthy.com"];
    // if the url was created
    if (webViewUrl != nil)
    {
        
        // Access the delegate to get the URL Request
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        // set the delegate webViewUrl property to the request
        delegate.urlRequest = [[NSURLRequest alloc] initWithURL:webViewUrl];
        // if the delegate  request created correctly
        if (delegate.urlRequest != nil)
        {
            // Check if the web page can go back, if it can't
            if (!webview.canGoBack)
            {
                // Disable the back button until the page can go back
                backButton.enabled = false;
            }
            // Scale the page to fit in the webview
            webview.scalesPageToFit = true;
            //load the request into the webview
            [webview loadRequest:delegate.urlRequest];
        }
        
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)onClick:(id)sender
{
    // Create the button
    UIBarButtonItem * barButton = (UIBarButtonItem*) sender;
    // If button was created
    if (barButton != nil)
    {
        // Check the button tag
        if (barButton.tag == 0)
        { // this is the back button,
            // check if it can go back
            if (webview.canGoBack)
            {
                // send it back
                [webview goBack];
                // enable the button
                backButton.enabled = (webview.canGoBack);
            }
        }
        else if (barButton.tag == 1)
        { // This is the stop button
            // Check if it is loading
            if (webview.isLoading)
            {
                // If it is, stop it from loading
                [webview stopLoading];
            }
        }
        else if (barButton.tag == 2)
        { // This is the reload button
            //reload the page
            [webview reload];
        }
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // this only enables the button if the webview can go back a page, otherwise it remains disabled
    backButton.enabled = webview.canGoBack;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
