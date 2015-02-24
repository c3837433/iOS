//
//  CustomTestimonyObject.h
//  Engage Your City
//
//  Created by Angela Smith on 6/6/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTestimonyObject : NSObject
{
    NSString* storyText;
    NSString* storyDate;
}
// Properties for custom init
@property (nonatomic, readonly) NSString* storyText;
@property (nonatomic, readonly) NSString* storyDate;


// Create a custom init method that will create the objects
-(id)initWithTestimony:(NSString*)screenName date:(NSString*)date;

@end
