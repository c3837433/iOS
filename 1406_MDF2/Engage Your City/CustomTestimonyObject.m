//
//  CustomTestimonyObject.m
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "CustomTestimonyObject.h"

@implementation CustomTestimonyObject
@synthesize storyText, storyDate;

-(id)initWithTestimony:(NSString*)screenName date:(NSString*)date
{
    // Ititialize this as an object
    if ((self = [super init]))
    {
        // Save the data once it is pulled in
        storyText = [screenName copy];

    }
    return self;
}
@end
