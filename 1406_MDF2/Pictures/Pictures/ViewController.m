//
//  ViewController.m
//  Pictures
//
//  Created by Angela Smith on 6/14/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
/*
 Application Instructions
 
 Main View
 The main view consists of three buttons with images.
 1st =  image capture. It is up to you to create or find an icon for this button
 2nd =  video capture. Again, find an icon for this button
 3rd =  the photo album.
 At the bottom of the view, place some instructions
 
 Image Capture
 When clicking on the image button launch the UIImagePickerController and allow the user to take a snapshot.
 Make sure that edit mode is turned on. This will allow the user to scale and reframe the image after capture.
 When the user clicks the 'use' option, present a view that displays the original image as well as the scaled image.
 This view should also include a save and cancel button.
 The save button will save the original and scaled images to the photo album.
 Make sure to inform the user if the save has completed
 The cancel button will dismiss the view and nothing will be saved.
 
 Movie Capture
 When clicking on the movie button launch the UIImagePickerController in movie mode.
 Allow the user to capture video.
 Once capture is complete, display a view that gives the user the option to save or cancel.
 Save will save the movie to the photo album.
 Cancel will go back to the main view
 After saving, make sure to inform the user that save has completed.
 */

#import "ViewController.h"
#import "ButtonListTableViewCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "ImageViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ButtonListTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"appNavCells"];
    if (cell != nil) {
        // Create a view to change the color when the user selects on one of the cells
        UIView *cellBackground = [[UIView alloc] init];
        // Make background  a light transparant black
        cellBackground.backgroundColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
        // Set the cell background
        cell.selectedBackgroundView = cellBackground;
        // set the icons and text
        cell.iconImage.image = [buttonImageArray objectAtIndex:indexPath.row];
        cell.iconLabel.text = [buttonLabelArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger thisPath = indexPath.row;
    //NSLog(@" the index path.row = %d", thisPath);
    
    // Get the two view controllers
    UIImagePickerController* pickerVC = [[UIImagePickerController alloc] init];
    if (pickerVC != nil) {
        {
            // Determinw which betton is sending it
            if (thisPath == 0)
            {
                // This is the camera
                pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                pickerVC.allowsEditing = true;
            }
            else if (thisPath == 1)
            {
                // this is the video
                pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                // Select the media type
                pickerVC.mediaTypes = @[(NSString*) kUTTypeMovie];
            }
            else if (thisPath == 2)
            {
                // this is the library button
                // This lets you view the libraries
                pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                pickerVC.allowsEditing = true;
                // Be able to view both video and photo's in the library
                pickerVC.mediaTypes = @[(NSString*) kUTTypeImage, (NSString*)kUTTypeMovie];
            }
            
            // Picker control's delegate is set in the header
            pickerVC.delegate = self;
            // allow editing by cropping the image
            pickerVC.allowsEditing = true;
            
            // display control
            [self presentViewController:pickerVC animated:true completion:nil];
        }
        // Remove the highlight on the cell
        [buttonTableView deselectRowAtIndexPath:indexPath animated:true];
    }
    
}
    
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Set the height for the tableview cells
    return 60;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"info = %@", info);
    // Get the image view controller in storyboard to present after the user selects a photo
    ImageViewController *imageVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PhotoEditandSave"];
    if (imageVC != nil) {
        // Check the sourceType
        NSString* sourceType = [info objectForKey:@"UIImagePickerControllerMediaType"];
        if ([sourceType isEqualToString:@"public.movie"])
        {
            // This is a movie, get it's path
            NSURL* pathUrl = [info objectForKey:@"UIImagePickerControllerMediaURL"];
            // Convert the path to a string
            NSString* pathString = [pathUrl path];
            // Pass the video to the next view
            if (pathString != nil)
            {
                // Close the picker, pass the path to and open the next vc
                [picker dismissViewControllerAnimated:YES completion:^{
                    imageVC.moviePath = pathString;
                    [self presentViewController:imageVC animated:YES completion:nil];
                }];

            }
        
        } else if ([sourceType isEqualToString:@"public.image"])
        {
            // These are images from the album or camera, get the origional and edited versions to pass to the next view
           UIImage* selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
            if (selectedImage != nil) {
                // if it is not nil, there is a problem with the image
                UIImage* croppedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
                if (croppedImage != nil) {
                    // Close the picker VC, and when completed set the values to the next view and open it
                    [picker dismissViewControllerAnimated:YES completion:^{
                        imageVC.origionalImage = selectedImage;
                        imageVC.croppedImage = croppedImage;
                        // Tell the vc that we are passing an image over
                        imageVC.isImage = YES;
                        [self presentViewController:imageVC animated:YES completion:nil];
                    }];
                }
            }
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{

    // Create the label text array
    buttonLabelArray = @[@"Image", @"Video", @"Album"];
    // create the button images
    buttonImageArray = @[[UIImage imageNamed:@"camera.png"], [UIImage imageNamed:@"video.png"], [UIImage imageNamed:@"album.png"]];
}
@end
