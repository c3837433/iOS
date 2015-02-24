//
//  TheatreInfo.h
//  InTheatres
//
//  Created by Angela Smith on 6/19/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//  TheaterInfo will contain all the information required for a single theater including name, location, theater image, along with an array of movieInfo objects for that theater.

#import <Foundation/Foundation.h>

@interface TheatreInfo : NSObject
{
    
}

@property (nonatomic, strong) NSString* theatreName;
@property (nonatomic, strong) UIImage* theatreImage;
@property (nonatomic, strong) NSString* theatreAddress;
@property (nonatomic, strong) NSArray* theatreMovies;
@end
