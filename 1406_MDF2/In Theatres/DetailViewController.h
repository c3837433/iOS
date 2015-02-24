//
//  DetailViewController.h
//  In Theatres
//
//  Created by Angela Smith on 6/19/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfoObject.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UIImageView* moviePicture;
    IBOutlet UILabel* movieTitle;
    IBOutlet UILabel* movieRating;
    IBOutlet UITextView* movieDesctiption;
    IBOutlet UILabel* movieShowtimes;
    IBOutlet UILabel* movieTheatreName;
}
@property (nonatomic, strong) MovieInfoObject* thisMovie;
@end
