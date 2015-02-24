//
//  ViewController.m
//  photoCapture
//
//  Created by Angela Smith on 6/12/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onClick:(id)sender
{
    UIImagePickerController* imageController = [[UIImagePickerController alloc] init];
    if (imageController != nil) {
        imageController.sourceType = UIImagePickerControllerSourceTypeCamera;
        imageController.delegate = self;
        
        // Show view controlelr
        [self presentViewController:imageController animated:true completion:nil];
    }
}
// Tell the view controller what to do with the image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", info);
    UIImage* takenImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (takenImage != nil) {
        loadedImage.image = takenImage;
    }
    /*
     // Save the image to the photo album
     UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
     // The completeion selector has 3 parameters, an image, an error code (success or failure), any info you want to pass in to the image, such as a title or ID for the user - this does not get saved to the photo album though
     // -(void)                     image: (UIImage*) image
     //didFinishSavingWitherror: (NSError*) error
     //contextInfo: (void*) contextInfo;
     
    // Tell the picker view controller to close
    */
    [picker dismissViewControllerAnimated:true completion:nil];

}

@end
