//
//  AddStoryViewController.h
//  Good Feed
//
//  Created by Angela Smith on 8/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddStoryViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate, UITextFieldDelegate, UITextViewDelegate>

{
    AddStoryViewController* addStoryVC;
    NSUserDefaults* userDefaults;
    UIImagePickerController* pickerVC;
    NSURL* movieUrl;
    UIImage* thumbnail;
    NSString* storyType;
    IBOutlet UIView* addMediaView;
    IBOutlet UIView* cancelMediaView;
    UIBarButtonItem* saveButton;
}

@property (nonatomic, strong) IBOutlet UITextField* enteredPostTitle;
@property (nonatomic, strong) IBOutlet UITextView* enteredPostStory;
@property (nonatomic, strong) IBOutlet UIImageView* mediaThumbnail;
@property (nonatomic, strong) NSData* mediaDataFile;
@property (nonatomic, strong) NSData* mediaThumbDataFile;

-(IBAction)onClick:(UIButton*)button;
-(void)toggleButtonOptions:(BOOL)value;

@end
