//
//  ResearchDetailViewController.m
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ResearchDetailViewController.h"
// import the webView
#import "ResearchUrlWebViewController.h"
@interface ResearchDetailViewController ()

@end

@implementation ResearchDetailViewController
@synthesize currentArticle;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    // when the view loads, display the passed article on the view
    articleTitle.text = self.currentArticle.researchTitle;
    articleSummary.text = self.currentArticle.researchSummary;
    articleReference.text = self.currentArticle.researchReference;
}

// Call the prepare for segue to move to the webview for the article
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // The destination we are moving to is the research detail view
    ResearchUrlWebViewController* researchWebVC = segue.destinationViewController;
    if (researchWebVC != nil) {
        // set the current researchurl to the currentUrl
        researchWebVC.currentstring = self.currentArticle.researchUrl;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
