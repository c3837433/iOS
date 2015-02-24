//
//  HomeViewController.h
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
{
    //IBOutlet UILabel* locationName;
    IBOutlet UILabel* locationReview;

    
}

// Create a method that will rotate through the reviews
-(void)rotateReviews:(NSTimer *)timer;
@end
