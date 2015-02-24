//
//  CustomSubjectCell.h
//  Physics
//
//  Created by Angela Smith on 3/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSubjectCell : UITableViewCell
{
    // Create outlets for the labels and imageView
    IBOutlet UILabel* subjectTitle;
    IBOutlet UILabel* subjectSubTitle;
    IBOutlet UIImageView* subjectImage;
}

// Call this method every time the view needs to be updated
-(void)refreshCellWithData:(NSString*) subjectHeader subtitle:(NSString*) subtitle subImage:(UIImage*)subImage;
@end
