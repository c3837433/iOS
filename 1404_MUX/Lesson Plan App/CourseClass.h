//
//  CourseClass.h
//  Lesson Plan App
//
//  Created by Angela Smith on 4/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LessonClass.h"
#import "CourseInstructor.h"
@interface CourseClass : NSObject
{}
@property (strong) LessonClass *lesson;
@property (nonatomic, strong) NSMutableArray* lessons;
@property (nonatomic, strong) NSString* courseSubject;
@property (nonatomic, strong) NSString* courseResources;
@property (nonatomic, strong) CourseInstructor* courseInstructor;
@property (nonatomic, strong) NSString* courseSyllabus;


@end
