//
//  ProfileViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Parse/Parse.h>

@interface ProfileViewController : PFQueryTableViewController

{
    //UIView* headerView;
}
@property (nonatomic, strong) IBOutlet UILabel* authorName;
@property (nonatomic, strong) IBOutlet UILabel* authorLocation;
@property (nonatomic, strong) IBOutlet PFImageView* authorPic;
@property (nonatomic, strong) IBOutlet UIView* headerView;

-(void)updateUserProfileInfo;

@end
