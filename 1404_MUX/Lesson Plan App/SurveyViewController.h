//
//  SurveyViewController.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyViewController : UIViewController <UIWebViewDelegate>
{
    // Create an outlet for the webView
    IBOutlet UIWebView* surveyWebView;
    NSURLRequest* request;
}
// Access the webView
@property (nonatomic, strong)IBOutlet UIWebView* surveyWebView;

@end
