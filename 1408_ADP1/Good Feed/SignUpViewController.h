//
//  SignUpViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Parse/Parse.h>

@interface SignUpViewController : PFSignUpViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImageView* userNameField;
@property (nonatomic, strong) UIImageView* emailField;
@property (nonatomic, strong) UIImageView* password1Field;
@property (nonatomic, strong) UIImageView* password2Field;
@property (nonatomic, strong) UIImageView* cameraLensView;
@property (nonatomic, strong) UIButton* addProfilePicButton;

@property (nonatomic, strong) IBOutlet UIImageView* imageThumbnail;
@property (nonatomic, strong) NSData* imageData;

-(BOOL)checkUserInformation;

@end
