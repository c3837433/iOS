//
//  WebViewController.h
//  Project4
//
//  Created by Angela Smith on 3/21/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate, UITabBarDelegate>
{
    // Create the outlets to the webview and buttons 
    IBOutlet UIBarButtonItem* backButton;
    IBOutlet UIBarButtonItem* stopButton;
    IBOutlet UIBarButtonItem* reloadButton;
    IBOutlet UIWebView* webview;
    IBOutlet UIToolbar* toolbar;
}
// Create an onclick method for when the user clicks on the webview bottons
-(IBAction)onClick:(id)sender;
@property(nonatomic,retain) UIColor *selectedImageTintColor;
@end
