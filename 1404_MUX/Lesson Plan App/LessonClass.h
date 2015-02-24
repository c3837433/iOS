//
//  LessonClass.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LessonClass : NSObject
{
}
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* resource;
@property (nonatomic, strong) NSString* info;
@property (nonatomic, strong) NSString* unit;
@property (nonatomic, strong) NSString* number;
@property (nonatomic, strong) NSString* subject;
@property (nonatomic) BOOL completed;
@end
