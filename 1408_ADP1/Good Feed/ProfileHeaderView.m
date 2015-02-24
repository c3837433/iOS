//
//  ProfileHeaderView.m
//  Good Feed
//
//  Created by Angela Smith on 8/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ProfileHeaderView.h"
#import "UIImage+RoundedCornerAdditions.h"

@implementation ProfileHeaderView

@synthesize authorLocation, authorName, authorPic;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setAuthorHeaderInfo:(PFUser*)author
{
    authorName.text = [author objectForKey:@"UserFullName"];
    
    authorLocation.text = [author objectForKey:@"UserLocation"];
    // Create a file for the image
    PFFile* imageFile = [author objectForKey:@"ProfilePicture"];
    // Set the corner radius of the PFImageView
    authorPic.layer.cornerRadius = 8;
    // set the image to the PFimage view
    authorPic.file = imageFile;
    // Load the image
    [authorPic loadInBackground];
    // Mask the image within the imageview
    authorPic.clipsToBounds = YES;
}

@end
