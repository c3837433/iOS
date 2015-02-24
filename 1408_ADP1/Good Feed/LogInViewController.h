//
//  LogInViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <Parse/Parse.h>

@interface LogInViewController : PFLogInViewController <UITextFieldDelegate, PFLogInViewControllerDelegate>

@property (nonatomic, strong) UIImageView* emailFieldView;
@property (nonatomic, strong) UIImageView* passwordFieldView;
@property (nonatomic, strong) UIImageView* separatorOrLineView;
@property (nonatomic, strong) UIButton* registerButton;
@property (nonatomic, strong) UILabel* registerLabel;

-(void)didSignUpUser;
@end
