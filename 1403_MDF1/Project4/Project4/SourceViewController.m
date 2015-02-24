//
//  SourceViewController.m
//  Project4
//
//  Created by Angela Smith on 3/21/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SourceViewController.h"
// import the webVC
//#import "WebViewController.h"
// Import the AppDelegate
#import "AppDelegate.h"
@interface SourceViewController ()

@end

@implementation SourceViewController

- (void)viewDidLoad
{
    // Get the url request from the app delegate
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    urlRequest = delegate.urlRequest;
    if (urlRequest != nil)
    {
        //Create the connection
        connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        // create our mutable object
        requestedData = [NSMutableData data];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
// Collect the data being passed back, and add it to the data as it comes
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil) {
        // Add the data to the mutable array
        [requestedData appendData:data];
    }
}

// When we have finished collecting the data from the request
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // convert the data to a string
    NSString* dataString = [[NSString alloc] initWithData:requestedData encoding:NSASCIIStringEncoding];
    // Display the string in the textView
    sourceText.text = dataString;
    // stop the textview from being editable
    sourceText.editable = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
