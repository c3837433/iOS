//
//  LocationsManager.m
//  project3
//
//  Created by Angela Smith on 3/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "LocationsManager.h"

@implementation LocationsManager
// synthesize the array
@synthesize allLocations;

// Create a static instance that will internally hold a pointer to myself
static LocationsManager* _instance = nil;
// Create an instance when the app loads
/*+(void)BeginInstanceOnLoad
{
    // If an instance has not been created yet
    if (_instance == nil) {
        // Allow it to create itself by calling the alloc method
        [[self alloc] init];
    }
}
 */
// get back a pointer for the location manager wherever I want an instance of it
/*+(LocationsManager*)StartInstance;
{
    return _instance;
}
*/
+(LocationsManager*)StartInstance;
{
    if (_instance == nil) {
        // Allow it to create itself by calling the alloc method
        _instance = [[self alloc] init];
        NSLog(@"Instance was created");
    }
    
    return _instance;
}

// Override the static instance of alloc
+(id)alloc
{
    // this is where instance is set
    // This will allocate the instance and return it to StartInstance
    _instance = [super alloc];
    return _instance;
}
// Perform a normal init
-(id)init
{
    if (self = [super init]) {
        // Initialize the array
        allLocations = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObject:(id)object
{
    [allLocations addObject:object];
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
    [allLocations addObjectsFromArray:otherArray];
    NSLog(@"The array was added");
    NSLog(@"%@", allLocations);
}

@end
