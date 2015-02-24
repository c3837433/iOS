//
//  MovieViewController.m
//  In Theatres
//
//  Created by Angela Smith on 6/20/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController
@synthesize movieInfo;

- (void)viewDidLoad
{
    // set the title to the view
    self.navigationItem.title = movieInfo.movieName;
    // fix the view on device rotation
    playerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        // This is the play button, get the video that was passed with this view
        NSURL* fileUrl = [NSURL URLWithString:movieInfo.movieTrailerUrlString];
        moviePlayerControl = [[MPMoviePlayerController alloc] initWithContentURL:fileUrl];
        if (moviePlayerControl != nil)
        {
            // Remove default controls
            moviePlayerControl.controlStyle = MPMovieControlStyleNone;
            moviePlayerControl.scalingMode = MPMovieScalingModeAspectFit;                           //
            // set the frame of the playerView
            [moviePlayerControl.view setFrame: playerView.bounds];
            // Make the view adjustable
            [playerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
            [moviePlayerControl.view setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
            //[playerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
            
            // Turn fullscreen off
            moviePlayerControl.fullscreen = false;
            
            // Add the player to the screen
            [playerView addSubview:moviePlayerControl.view];
            // Begin playing movie
            [moviePlayerControl play];
            
        }
    }
    else if (button.tag == 1)
    {
        // Stop Button
        // If movie control is running
        if (moviePlayerControl != nil)
        {
            // Stop playing the movie
            [moviePlayerControl stop];
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
