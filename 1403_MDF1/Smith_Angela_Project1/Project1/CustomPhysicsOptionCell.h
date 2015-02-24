//
//  CustomPhysicsOptionCell.h
//  Project1
//
//  Created by Angela Smith on 3/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPhysicsOptionCell : UITableViewCell
{
    // Create outlets for the labels and imageView
    IBOutlet UILabel* cellTitle;
    IBOutlet UILabel* cellDescription;
    IBOutlet UIImageView* cellImage;
}

// define a method that will refresh all the cells with data when called
-(void)refreshCellWithData:(NSString*) subjectHeader subjectSubtitle:(NSString*) subjectSubtitle subjectImage:(UIImage*)subjectImage;
@end
