//
//  DataHelper.m
//  Good Feed
//
//  Created by Angela Smith on 8/8/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "DataHelper.h"
#import <Parse/Parse.h>
#import "UIImage+ResizeAdditions.h"

@implementation DataHelper

+(void)saveFacebookImageData:(NSData*)imageData
{
    if (imageData != nil)
    {
        // We have data, create an image out of it
        UIImage* pictureImage = [UIImage imageWithData:imageData];
        // Resize the image so it is small enough to work in both the profile view and list views. Aldo round the corners
        UIImage* resizedImage = [pictureImage thumbnailImage:75 transparentBorder:0 cornerRadius:8 interpolationQuality:kCGInterpolationMedium];
        
        //Turn the image into data, and a PFFile
        NSData* newImageData = UIImagePNGRepresentation(resizedImage);
        if (newImageData != nil)
        {
            // Save this to parse
            PFFile* profilePicFile = [PFFile fileWithData:newImageData];
            [profilePicFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error)
                {
                    // Set the picture to the current user's profile picture
                    [[PFUser currentUser] setObject:profilePicFile forKey:@"ProfilePicture"];
                    // Save this whenever the user has internet
                    [[PFUser currentUser] saveEventually];
                }
            }];
        }
    }
}

@end
