//
//  CustomResearchCell.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomResearchCell : UITableViewCell
{
    // Create outlets for the  Research labels
    IBOutlet UILabel* researchTitle;
}

// define a method that will refresh all the cells with data when called
-(void)refreshCellWithData:(NSString*) articleTitle;
@end
