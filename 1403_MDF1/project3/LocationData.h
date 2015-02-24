//
//  LocationData.h
//  project3
//
//  Created by Angela Smith on 3/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
// import the mapkit
#import <MapKit/MapKit.h>

@interface LocationData : NSObject

// Define the properties to hold the location data
@property NSString* locationTitle;
@property CLLocationCoordinate2D locationCoords;

@end
