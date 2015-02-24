//
//  DetailViewController.m
//  In Theatres
//
//  Created by Angela Smith on 6/19/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "DetailViewController.h"
#import "MovieViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize thisMovie;

- (void)viewDidLoad
{
    // Set the movie data to the view
    moviePicture.image = thisMovie.movieImage;
    movieTitle.text = thisMovie.movieName;
    movieRating.text = thisMovie.movieRating;
    movieDesctiption.text = thisMovie.movieDescription;
    movieDesctiption.textColor = [UIColor whiteColor];
    movieRating.text = thisMovie.movieRating;
    movieShowtimes.text = thisMovie.movieShowTimes;
    movieTheatreName.text = thisMovie.movieTheatre;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MovieViewController* movieVC = segue.destinationViewController;
    if (movieVC != nil)
    {
        movieVC.movieInfo = thisMovie;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
