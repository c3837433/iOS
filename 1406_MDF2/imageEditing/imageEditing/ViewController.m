//
//  ViewController.m
//  imageEditing
//
//  Created by Angela Smith on 6/13/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    /*
     // get the list of image filters on the device
     NSArray* filtersAvailable = [CIFilter filterNamesInCategory:
     kCICategoryBuiltIn];
     NSLog(@"%@", filtersAvailable);
     // for each filter available, list out the property information
     for (NSString* filterName in filtersAvailable) {
     CIFilter* thisFilter = [CIFilter filterWithName:filterName];
     NSLog(@"%@", [thisFilter attributes]);
     }
     */
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// Open the ImagePickerController and present camera when button is clicked
-(IBAction)onLoadCameraClick:(id)sender
{
    // Create the image picker control
    UIImagePickerController* imageController = [[UIImagePickerController alloc] init];
    if (imageController != nil) {
        // We want to access the camera to capture an image
        imageController.sourceType = UIImagePickerControllerSourceTypeCamera;
        imageController.delegate = self;
        
        // Show view controller
        [self presentViewController:imageController animated:true completion:nil];
    }
}

// Tell the view controller what to do with the image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", info);
    // Create a UIImage
    UIImage* takenImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (takenImage != nil) {
        // set the image to the UIImageViews
        loadedImage.image = takenImage;
        editedImage.image = takenImage;
    }
    
    //beginImage = [CIImage imageWithContentsOfURL:imagePath];
    CIImage* currentImage = (CIImage*)loadedImage.image;
    CIContext* context = [CIContext contextWithOptions:nil];
    
    CIFilter* firstFilter = [CIFilter filterWithName:@"CISepiaTone"
                        keysAndValues:kCIInputImageKey, currentImage, @"inputIntensity",
              @0.0, nil];
    
    CIImage *outputImage = [firstFilter outputImage];
    
    // 2 Here you use a method on the context object to draw a CGImage. Calling the createCGImage:fromRect: on the context with the supplied CIImage will produce a CGImageRef.
    CGImageRef cgimg =
    [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    // 3 Next, you use UIImage +imageWithCGImage to create a UIImage from the CGImage.
    UIImage *newImage = [UIImage imageWithCGImage:cgimg];
    editedImage.image = newImage;
    
    // 4 Finally, release the CGImageRef. CGImage is a C API that requires that you do your own memory management, even with ARC.
    CGImageRelease(cgimg);

    // Save the image to the photo album
    UIImageWriteToSavedPhotosAlbum(takenImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    // The completeion selector has 3 parameters, an image, an error code (success or failure), any info you want to pass in to the image, such as a title or ID for the user - this does not get saved to the photo album though
    // -(void)                     image: (UIImage*) image
    //didFinishSavingWitherror: (NSError*) error
    //contextInfo: (void*) contextInfo;
    
    // Tell the picker view controller to close
    [picker dismissViewControllerAnimated:true completion:nil];
    
}

// Created actions that pull the updated slider values when each is changed
- (IBAction)highLightSliderChanged:(UISlider *)highlightSlider
{
    // set the float value to the slider value
    highLightValue = highlightSlider.value;
    NSLog(@"Highlight = %f", highLightValue);
    // Update image
    [self getNewImageFromUpdatedSliderValues];
}

- (IBAction)shadowSliderChanged:(UISlider *)shadowSlider
{
    shadowValue = shadowSlider.value;
    NSLog(@"Shadow = %f", shadowValue);
    [self getNewImageFromUpdatedSliderValues];
}

- (IBAction)vibranceSliderChanged:(UISlider *)vibranceSlider
{
    vibranceValue = vibranceSlider.value;
    NSLog(@"Vibrance = %f", vibranceValue);
    [self getNewImageFromUpdatedSliderValues];
}

-(IBAction)loadDefaultImage:(id)sender
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"smalltestphoto" ofType:@"png"];
    NSURL* imagePath = [NSURL fileURLWithPath:filePath];
    NSLog(@"%@", imagePath);
    //CIImage* editableImage = [CIImage imageWithContentsOfURL:imagePath];
    currentImage = [CIImage imageWithContentsOfURL:imagePath];
    UIImage* defaultImage = [UIImage imageNamed:@"smalltestphoto.png"];
    loadedImage.image = defaultImage;
}

-(void)getNewImageFromUpdatedSliderValues
{
    // Get the current slider values
    float highLight = highLightValue;
    float shadow = shadowValue;
    float vibrance = vibranceValue;
    
    // Get the current image and cast it to a CIImage
    //CIImage* currentImage = (CIImage*)loadedImage.image;
    CIImage* thisImage = currentImage;
    //NSURL* imageUrl = [NSURL URLWithString:urlString];
    //CIImage* currentImage = [CIImage imageWithContentsOfURL:imageUrl];
    
    // Set the image context
    CIContext* context = [CIContext contextWithOptions:nil];
    
    // Pass the updated values to change the photo with the filter stack adjustments
    // CRASH IS ON THIS METHOD
    CIImage* outputImage = [self previousPhoto:currentImage lightLevel:highLight shadowLevel:shadow vibranceLevel:vibrance];
    
    // Create the new image with the filter changes
    CGImageRef createdNewImage = [context createCGImage:outputImage
                                               fromRect:[outputImage extent]];
    // Create the new updated image
    UIImage* updatedImage = [UIImage imageWithCGImage:createdNewImage];
    
    // Set the new edited image to the imageview
    editedImage.image = updatedImage;
    // release the previous edit
    CGImageRelease(createdNewImage);
}
// Apply filters to image
-(CIImage *)previousPhoto:(CIImage *)image lightLevel:(float)lightLevel shadowLevel:(float)shadowLevel vibranceLevel:(float)vibranceLevel
{
    
    
    // HIGHLIGHT & SHADOW FILTER
    // Create the filter
    CIFilter* highlight = [CIFilter filterWithName:@"CIHighlightShadowAdjust"];
    // Set image to apply it on
    [highlight setValue:image forKey:kCIInputImageKey];
    // set the highlight and shadow levels from the sliders
    [highlight setValue:@(lightLevel) forKey:@"inputHighlightAmount"];
    [highlight setValue:@(shadowLevel)forKey:@"inputShadowAmount"];
    // get the result and turn in into a new CIImage
    CIImage *result = [highlight valueForKey: kCIOutputImageKey];
    
    /* info from CIHighlightShadowAdjust
     CIAttributeFilterDisplayName = "Highlights and Shadows";
     CIAttributeFilterName = CIHighlightShadowAdjust;
     inputHighlightAmount =     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 1;
     CIAttributeIdentity = 1;
     CIAttributeMax = 1;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "0.3";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     inputRadius =     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMin = 0;
     CIAttributeSliderMax = 10;
     CIAttributeSliderMin = 1;
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputShadowAmount =     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     */
    
    // VIBRANCE FILTER
    CIFilter* vibrance = [CIFilter filterWithName:@"CIVibrance"];
    // Pass the last filter version to this filter
    [vibrance setValue:result forKey:kCIInputImageKey];
    [vibrance setValue:@(vibranceLevel) forKey:@"inputAmount"];
    result = [vibrance valueForKey: kCIOutputImageKey];
    // CRASH IS HERE "-[UIImage _imageByApplyingBlur:]: unrecognized selector sent to instance 0x17009d790"
    /*
     Info for CIVibrance
     CIAttributeFilterDisplayName = Vibrance;
     CIAttributeFilterName = CIVibrance;
     inputAmount =     {
     CIAttributeClass = NSNumber;
     CIAttributeDefault = 0;
     CIAttributeIdentity = 0;
     CIAttributeMax = 1;
     CIAttributeMin = "-1";
     CIAttributeSliderMax = 1;
     CIAttributeSliderMin = "-1";
     CIAttributeType = CIAttributeTypeScalar;
     };
     inputImage =     {
     CIAttributeClass = CIImage;
     CIAttributeType = CIAttributeTypeImage;
     };
     */
    
    // Return the output of the final filter
    return result;
}

-(void)image: (UIImage*) image didFinishSavingWithError: (NSError*) error contextInfo: (void*) contextInfo
{
    // Get the info of the saved image
    NSLog(@"%@", contextInfo);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
