//
//  AddStoryViewController.m
//  Good Feed
//
//  Created by Angela Smith on 8/10/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AddStoryViewController.h"
#import "MBProgressHUD.h"
#import <Parse/Parse.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import "DataHelper.h"

@interface AddStoryViewController ()

@end

@implementation AddStoryViewController

@synthesize enteredPostStory, enteredPostTitle, mediaDataFile, mediaThumbDataFile, mediaThumbnail;

- (void)viewDidLoad
{
    // Recognize when the user taps off the text areas
    UITapGestureRecognizer* tapOffField = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tapOffField];
    
    // Add a Done button that will dismiss the keyboard when touched
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:enteredPostStory action:@selector(resignFirstResponder)];
    // Create a flexible space to mofe the button to the right
    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    flexSpace.width = 240.0f;
    // Create the keyboard toolbar
    UIToolbar* keyboardBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 40.0f)];
    // Add items to the toolbar
    keyboardBar.items = [NSArray arrayWithObjects:flexSpace, doneButton, nil];
    enteredPostStory.inputAccessoryView = keyboardBar;
    
    // Access the save button
    saveButton = self.navigationItem.rightBarButtonItem;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)hideKeyBoard
{
    // Close keyboard
    [enteredPostTitle resignFirstResponder];
    [enteredPostStory resignFirstResponder];
}

-(void)viewDidAppear:(BOOL)animated
{
    // Check if user has given permission to share stories
    userDefaults = [NSUserDefaults standardUserDefaults];
    if (userDefaults != nil)
    {
        NSString* permission = [userDefaults objectForKey:@"sharePermission"];
        if (![permission isEqualToString:@"YES"])
        {
            [[[UIAlertView alloc] initWithTitle:@"Permission to Share" message:@"By submitting this story I am giving consent for it to be shared with Good Feed users." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"I Agree", nil] show];
        }
    }
}

// If the user gave permission, change the default and store that value as a PFUser value
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // user denied consent return to story feed view 
        self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
    }
    else if (buttonIndex == 1)
    {
        // Update the default
        [userDefaults setObject:@"YES" forKey:@"sharePermission"];
        [userDefaults synchronize];
        // Update the user on parse
        PFUser* user = [PFUser currentUser];
        if (user != nil)
        {
            user[@"sharePermission"] = @"YES";
            [user saveEventually:^(BOOL succeeded, NSError *error) {
                if (error) {
                    NSLog(@"%@", error.description);
                }
            }];
        }
    }
}
-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 4)
    {
        // This was the cancel media button, remove media and return to main view
        mediaThumbnail.image = nil;
        [self toggleButtonOptions:NO];
    }
    else
    {
        // Create the picker controller and open it based on which button was selected
        pickerVC = [[UIImagePickerController alloc] init];
        if (pickerVC != nil) {
            
            if (button.tag == 1)
            {
                // Camera button
                pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                pickerVC.allowsEditing = TRUE;
            }
            else if (button.tag == 2)
            {
                // Video button
                pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                // Select the media type
                pickerVC.mediaTypes = @[(NSString*) kUTTypeMovie];
            }
            else if (button.tag == 3)
            {
                // album button
                pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                pickerVC.allowsEditing = TRUE;
                // Be able to view both video and photo's in the library
                pickerVC.mediaTypes = @[(NSString*) kUTTypeImage, (NSString*)kUTTypeMovie];
            }
            // set the delegate and display the picker
            pickerVC.delegate = self;
            [self presentViewController:pickerVC animated:true completion:nil];
        }
    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Show HUD view as the image is prepated 
    [MBProgressHUD showHUDAddedTo:self.view.superview animated:YES];
    // Check the sourceType
    NSLog(@"%@", info.description);
    NSString* sourceType = [info objectForKey:@"UIImagePickerControllerMediaType"];
    NSLog(@"the source type = %@", sourceType);
    if ([sourceType isEqualToString:@"public.movie"])
    {
        // A movie was recorded
        storyType = @"video";
        // Get the url
        movieUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        // To make a thumbnail image of this video, initialize the video as an AV asset
        AVURLAsset* avAsset = [[AVURLAsset alloc] initWithURL:movieUrl options:nil];
        NSParameterAssert(avAsset);
        // Generate an image from the video track
        AVAssetImageGenerator* aImgGen = [[AVAssetImageGenerator alloc] initWithAsset:avAsset];
        // If the video was taken in portrait mode transform the video so the pic will be right side up
        aImgGen.appliesPreferredTrackTransform = YES;
        // Do not apply apperature encoding
        aImgGen.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
        
        // Create an empty image reference
        CGImageRef thumbnailImageRef = NULL;
        
        // Take the image 2 seconds into the movie
        //CFTimeInterval imageAtSecond = 2;
        thumbnailImageRef = [aImgGen copyCGImageAtTime:CMTimeMake(2, 60) actualTime:NULL error:nil];
        // If we have a thumbnail image ref, create UIImage from it.
        UIImage* thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef]
        : nil;
        // Convert the video path to a string
        NSString* moviePath = [movieUrl path];
        // Pass the video to the next view
        if (moviePath != nil)
        {
            // If this video can be saved to the album, save it.
            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath))
            {
                UISaveVideoAtPathToSavedPhotosAlbum (moviePath, nil, nil, nil);
            }
            // Close the picker, pass the path to and open the next vc
            [picker dismissViewControllerAnimated:YES completion:^{
                // create a jpeg data image of the thumbnail to save as a PFFile
                mediaThumbDataFile = UIImageJPEGRepresentation(thumbnailImage, 1.0);
                // create the video data file
                mediaDataFile = [[NSData alloc] initWithContentsOfURL:movieUrl];
                //NSLog(@" movie media info = %@", mediaDataFile.description);
                // set the thumbnail image into the imageview
                mediaThumbnail.image = thumbnailImage;
                // display the image and cancel button
                [self toggleButtonOptions:true];
                // Remove the hud
                [MBProgressHUD hideHUDForView:self.view.superview animated:YES];
            }];
        }
    }
    // If the user selected an image
    else if ([sourceType isEqualToString:@"public.image"])
    {
        // Set the story type to photo
        storyType = @"image";
        NSLog(@"%@", info.description);
        // Get the image for the image view
        UIImage* dataThumbnail = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        if (dataThumbnail != nil)
        {   // Create a png data image for the PFFile and close the picker
            mediaThumbDataFile = UIImagePNGRepresentation(dataThumbnail);
            [picker dismissViewControllerAnimated:YES completion:^{
                // Set the thumbnail image in the chosen image view
                mediaThumbnail.image = dataThumbnail;
                [self toggleButtonOptions:true];
                // Hide the hud
                [MBProgressHUD hideHUDForView:self.view.superview animated:YES];
            }];
        }
        
    }
}

-(void)toggleButtonOptions:(BOOL)value
{
    // If we added an image, toggle between control views
    addMediaView.hidden = (value) ? YES : NO;
    cancelMediaView.hidden = (value) ? NO : YES;
    // If they cancel, reset the story type to text so we don't save it incorrectly
    if (!value) {
        storyType = @"text";
    }
}
#pragma mark SAVE STORIES TO PARSE

-(IBAction)checkStoryForSave:(UIButton*)button
{
    // Remove access to the view while saving
    saveButton.enabled = NO;

    // get the values for each item
    NSString* storyTitle = enteredPostTitle.text;
    NSString* storytext = enteredPostStory.text;
    if ((storytext.length == 0 || storyTitle.length == 0))
    {
        // Not saving, so restore access
        saveButton.enabled = YES;
        // Alert the user one of the fields is empty
        [[[UIAlertView alloc] initWithTitle:@"Missing Information" message:@"Please check that you have both a Title and Story" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];
    }
    else
    {
        // Start Hud
        [MBProgressHUD showHUDAddedTo:self.view.superview animated:YES];
        // make sure each story has a type
        NSLog(@"Storytype = %@", storyType);
        if (!([storyType isEqualToString:@"video"]) && (![storyType isEqualToString:@"image"])) {
            // then this is a text story
            storyType = @"text";
            NSLog(@"This must be a text story");
        }
        // Save the video
        [self saveStory:mediaDataFile mediaImage:mediaThumbDataFile title:storyTitle text:storytext];
    }
    
}


-(void)saveStory:(NSData*)videoData mediaImage:(NSData*)mediaImage title:(NSString*)title text:(NSString*)text
{

    PFUser* user = [PFUser currentUser];
    PFObject* newStory = [PFObject objectWithClassName:@"Story"];
    // Set main data
    [newStory setObject:user forKey:@"author"];
    [newStory setObject:title forKey:@"Title"];
    [newStory setObject:text forKey:@"Text"];
    
    // set media type
    [newStory setObject:storyType forKey:@"mediaType"];
    // If this is not a text story, save the image
    if (![storyType isEqualToString:@"text"])
    {
        PFFile* mediaThumb = [PFFile fileWithData:mediaImage];
        [newStory setObject:mediaThumb forKey:@"mediaThumb"];
    }
    // If Video, save the video
    if ([storyType isEqualToString:@"video"])
    {
        PFFile* videoFile = [PFFile fileWithName:@"video.mov" data:videoData];
        [newStory setObject:videoFile forKey:@"uploadedMedia"];
    }
    // Save the story
    [newStory saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         // Alert the user the story is saved
         [self storySavedAlert:succeeded];
         //   NSLog(@"The save was successful");
     }];
    // add the media options back to the view
    [self toggleButtonOptions:false];
    //Save complete restore button access
}



-(void)storySavedAlert:(BOOL)saved
{
    // Remove the hud
    [MBProgressHUD hideHUDForView:self.view.superview animated:YES];
    // Create alerts based on if saved or not
    NSString* alertTitle = (saved) ? @"Story Posted" : @"Couldn't Post Story";
    NSString* alertMessage = (saved) ? @"Thank you for sharing your story with Good Feed!" : @"Please try sharing your story again later";
    // Display the alert
    [[[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    // If it did save, the fields need to be emptied, otherwise leave the data to try again
    if (saved)
    {
        // Clear the current cells out
        enteredPostTitle.text = @"";
        enteredPostStory.text = @"";
        mediaThumbnail.image = nil;
    }
    // ReEnable the button
    saveButton.enabled = YES;

    
}

#pragma mark UITEXTFIELD DEEGATE METHODS
// Close keyboard when user touches off text field or
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // If the user hits return on the title field
    if(textField == enteredPostTitle)
    {
        // Move the user to the story field
        [enteredPostStory becomeFirstResponder];
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
