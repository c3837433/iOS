//
//  MySignUpViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogInViewController.h"

@interface MySignUpViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate, UITextFieldDelegate>

{
    IBOutlet UIView* mainView;
    UIImagePickerController* pickerVC;
    LogInViewController* logInVc;
}

@property (nonatomic, strong) IBOutlet UIButton* signUpButton;
@property (nonatomic, strong) IBOutlet UIButton* addProfilePicture;

@property (nonatomic, strong) IBOutlet UITextField* userNameField;
@property (nonatomic, strong) IBOutlet UITextField* emailField;
@property (nonatomic, strong) IBOutlet UITextField* password1Field;
@property (nonatomic, strong) IBOutlet UITextField* password2Field;

@property (nonatomic, strong) NSData* imageData;


@property (nonatomic, strong) IBOutlet UIImageView* cameraLensView;
@property (nonatomic, strong) IBOutlet UIImageView* imageThumbnail;

@end
