//
//  MovieInfoObject.h
//  In Theatres
//
//  Created by Angela Smith on 6/19/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//  MovieInfo will contain all the information required for a single movie including name, showtimes and trailer url.


#import <Foundation/Foundation.h>

@interface MovieInfoObject : NSObject
{
    
}

@property (nonatomic, strong) NSString* movieName;
@property (nonatomic, strong) NSString* movieShowTimes;
@property (nonatomic, strong) UIImage* movieImage;
@property (nonatomic, strong) NSString* movieTrailerUrlString;
@property (nonatomic, strong) NSString* movieRating;
@property (nonatomic, strong) NSString* movieDescription;
@property (nonatomic, strong) NSString* movieTheatre;

@end
