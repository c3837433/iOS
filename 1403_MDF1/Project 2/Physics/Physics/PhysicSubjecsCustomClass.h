//
//  PhysicSubjecsCustomClass.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhysicSubjecsCustomClass : NSObject
{

}
// Define the properties for the custom class
// A string to hold the subject name
@property (nonatomic, strong)NSString *subjectName;
@property (nonatomic, strong)NSString* subjectSubTitle;
// A string to hold the subject description
@property (nonatomic, strong)NSString *subjectDescription;
// An image for that particulat subject
@property (nonatomic, strong)UIImage* subjectImage;
// A string to hold the example of the subject
@property (nonatomic, strong)NSString* subjectExample;
// create a property to determine if there is a formula
@property(nonatomic)BOOL formula;

// Create the porperties to calculate the furmula
@property(nonatomic, strong)NSString* formulaNotes;
// Create the property values
@property (nonatomic, strong)NSString* formulaX;
@property (nonatomic, strong)NSString* formulaY;
@property (nonatomic, strong)NSString* formulaValue;


@end
