//
//  ViewController.m
//  PhotPicker
//
//  Created by Angela Smith on 6/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)onClick:(UIButton*)button
    
{
    // Start the UIImage picker control
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    if (picker != nil) {
        {
            
            if (button.tag == 0)
            {
                // this is the library button
                // This lets you view the libraries
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                picker.allowsEditing = true;
                // Be able to view both video and photo's in the library
                picker.mediaTypes = @[(NSString*) kUTTypeImage, (NSString*)kUTTypeMovie];
                // This lets you jump right into the album
                //picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
            else if (button.tag == 1)
            {
                // This is the camera
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.allowsEditing = true;
            }
            else if (button.tag == 2)
            {
                // this is the video
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                // Select the media type
                picker.mediaTypes = @[(NSString*) kUTTypeMovie];
            }
            
            // Picker control has a delegate which is a callback
            // needs to be set in header
            picker.delegate = self;
            // allow editing
            picker.allowsEditing = true;
            
            // display control
            [self presentViewController:picker animated:true completion:nil];
            
            
        }
    }

}
// Tell the picker what to do when it gets an image from the library
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"info = %@", info);
    // Check the sourceType
    NSString* sourceType = [info objectForKey:@"UIImagePickerControllerMediaType"];
    if ([sourceType isEqualToString:@"public.movie"])
    {
        // This is a movie
        // get the path of the movie
        NSURL* pathUrl = [info objectForKey:@"UIImagePickerControllerMediaURL"];
        // Convert the path to a string
        NSString* pathString = [pathUrl path];
        // save the video
        UISaveVideoAtPathToSavedPhotosAlbum(pathString, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        
    } else if ([sourceType isEqualToString:@"public.image"])
    {
        // These are images from the album or camera
        UIImage* selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        if (selectedImage != nil) {
            // if it is not nil, there is a problem with the image
            imageView.image = selectedImage;
        }
        UIImage* editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        if (editedImage != nil) {
            editedImageView.image = editedImage;
        }
        // Save the image to the photo album
        UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        // The completeion selector has 3 parameters, an image, an error code (success or failure), any info you want to pass in to the image, such as a title or ID for the user - this does not get saved to the photo album though
    }
    // Tell the picker view controller to close
    [picker dismissViewControllerAnimated:true completion:nil];
}

// Save video to album
- (void)video: (NSString *) videoPath didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if (error == nil)
    {
        // Alert user everything saved correctly
    }
    else
    {
        NSLog(@"%@", error);
        // Alert user there was a problem
    }
}

// save image to album
-(void)image: (UIImage*) image didFinishSavingWithError: (NSError*) error contextInfo: (void*) contextInfo
{
    if (error == nil)
    {
        // Alert user everything saved correctly
    }
    else
    {
        NSLog(@"%@", error);
        // Alert user there was a problem
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
