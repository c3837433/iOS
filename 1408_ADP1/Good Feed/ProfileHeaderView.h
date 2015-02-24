//
//  ProfileHeaderView.h
//  Good Feed
//
//  Created by Angela Smith on 8/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileHeaderView : UIView

@property (nonatomic, strong) IBOutlet UILabel* authorName;
@property (nonatomic, strong) IBOutlet UILabel* authorLocation;
@property (nonatomic, strong) IBOutlet PFImageView* authorPic;

-(void)setAuthorHeaderInfo:(PFUser*)author;

@end
