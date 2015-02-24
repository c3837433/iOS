//
//  ResearchUrlWebViewController.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResearchUrlWebViewController : UIViewController
{
    // Create an outlet for the webView
    IBOutlet UIWebView* researchWebView;
}
@property (nonatomic, strong)IBOutlet UIWebView* researchWebView;
@property (nonatomic, strong) NSString* currentstring;
@end
