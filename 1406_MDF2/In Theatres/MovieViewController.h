//
//  MovieViewController.h
//  In Theatres
//
//  Created by Angela Smith on 6/20/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfoObject.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController
{
    MPMoviePlayerController* moviePlayerControl;
    IBOutlet UIView* playerView;
}
@property (nonatomic, strong) MovieInfoObject* movieInfo;

- (IBAction)onClick:(UIButton*)button;
@end
