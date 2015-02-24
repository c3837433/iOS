//
//  ResearchCustomClass.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResearchCustomClass : NSObject
{
    
}
// Define the properties for the research class
// A string to hold the article title
@property (nonatomic, strong)NSString *researchTitle;
// A string to hold the URL
@property (nonatomic, strong)NSString* researchUrl;
// A string to hold the reference
@property (nonatomic, strong)NSString *researchReference;
// A string for the summary
@property (nonatomic, strong)NSString* researchSummary;
@end
