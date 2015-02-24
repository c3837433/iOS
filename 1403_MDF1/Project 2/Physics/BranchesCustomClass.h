//
//  BranchesCustomClass.h
//  Physics
//
//  Created by Angela Smith on 3/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BranchesCustomClass : NSObject
{
    
}
// Define the properties for the branches object properties
// A string for the title
@property (nonatomic, strong)NSString *branchTitle;
// A string for the intro
@property (nonatomic, strong)NSString* branchIntro;
// A string for the first branch
@property (nonatomic, strong)NSString* firstbranch;
// A string for the second branch
@property (nonatomic, strong)NSString* secondBranch;
// A string for the third branch
@property (nonatomic, strong)NSString* thirdBranch;
@end
