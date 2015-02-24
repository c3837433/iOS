//
//  LocationsManager.h
//  project3
//
//  Created by Angela Smith on 3/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationsManager : NSObject
// create an array property to hold all the location data
@property (nonatomic, retain) NSMutableArray* allLocations;


// Create a static method for the instance
+(LocationsManager*)StartInstance;
// and to begin it on load
//+(void)BeginInstanceOnLoad;

// add objects to the array
- (void)addObject:(id)object;

- (void)addObjectsFromArray:(NSArray *)otherArray;

@end
