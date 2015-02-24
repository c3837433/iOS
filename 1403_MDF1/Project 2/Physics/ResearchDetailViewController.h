//
//  ResearchDetailViewController.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

// import the research custom class
#import "ResearchCustomClass.h"
@interface ResearchDetailViewController : UIViewController
{
    // Create outlets for the article details
    IBOutlet UILabel* articleTitle;
    IBOutlet UILabel* articleSummary;
    IBOutlet UILabel* articleReference;

}
// Create an object for for the custom research class to pass data to the second view
@property (nonatomic, strong) ResearchCustomClass* currentArticle;

@end
