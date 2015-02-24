//
//  PhysicSubjectsCustomClass.h
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhysicSubjectsCustomClass : NSObject
{
    
}
// Create properties to hold the data
// A string to hold the subject name
@property (nonatomic, strong)NSString *subjectName;
@property (nonatomic, strong)NSString* subjectSubTitle;
// A string to hold the subject description
@property (nonatomic, strong)NSString *subjectDescription;
// An image for that particulat subject
@property (nonatomic, strong)UIImage* subjectImage;

@end
