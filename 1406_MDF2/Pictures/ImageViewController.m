//
//  ImageViewController.m
//  Pictures
//
//  Created by Angela Smith on 6/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
// Filters, CIColorCOntrols, CIExposureAdjust, CIPhotoEffectChrome (vintage color pop), CIPhotoEffectNoir (BW)

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController
@synthesize isImage, origionalImage, croppedImage, moviePath, slider1HighlightContrast, slider2ShadowBrightness, slider3VibranceSaturation;

- (void)viewDidLoad
{
    // Check what was sent over
    if (isImage == YES)
    {
        // Hide the image view
        photoView.hidden = NO;
        movieView.hidden = YES;
        // An Image was sent over, add it to the view
        startImage.image = origionalImage;
        finalImage.image = croppedImage;
        
    } else if (isImage == NO)
    {
        photoView.hidden = YES;
        movieView.hidden = NO;
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        // Close view on cancel
        [self dismissViewControllerAnimated:true completion:nil];
    }
    else if (button.tag == 1)
    {
        // Check what kind of media we are saving
        if (isImage == YES)
        {
            // We are saving an image, Save the image to the photo album
            UIImageWriteToSavedPhotosAlbum(origionalImage, self, nil, nil);
            UIImageWriteToSavedPhotosAlbum(finalImage.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            
        }
        else if (isImage == NO)
        {
            // We are saving a movie
            UISaveVideoAtPathToSavedPhotosAlbum(moviePath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    else if (button.tag == 3)
    {
        // Color adjustments (contrast = value1, brightness = value2, saturation = value3)
        // Show sliders, hide buttons
        slider1HighlightContrast.hidden = NO;
        slider2ShadowBrightness.hidden = NO;
        slider3VibranceSaturation.hidden = NO;
        antiquePop.hidden = YES;
        blackAndWhitePop.hidden = YES;
        // Change slider defaults
        slider1HighlightContrast.maximumValue = 4;
        slider3VibranceSaturation.value = 1;
        slider3VibranceSaturation.minimumValue = 0;
        slider3VibranceSaturation.maximumValue = 2;
        // Change labels
        slider1Label.text = @"Contrast";
        slider2Label.text = @"Brightness";
        slider3Label.text = @"Saturation";
        slider1Label.hidden = NO;
        slider2Label.hidden = NO;
        slider3Label.hidden = NO;
        isColorSliders = YES;
        
    }
    else if (button.tag == 4)
    {
        // Light adjustments
        slider1HighlightContrast.hidden = NO;
        slider2ShadowBrightness.hidden = NO;
        slider3VibranceSaturation.hidden = NO;
        antiquePop.hidden = YES;
        blackAndWhitePop.hidden = YES;
        // Change slider defaults
        slider1HighlightContrast.maximumValue = 1;
        slider3VibranceSaturation.value = 0;
        slider3VibranceSaturation.minimumValue = -1;
        slider3VibranceSaturation.maximumValue = 1;
        // Change labels
        slider1Label.text = @"Highlights";
        slider2Label.text = @"Shadows";
        slider3Label.text = @"Vibrance";
        slider1Label.hidden = NO;
        slider2Label.hidden = NO;
        slider3Label.hidden = NO;
        // Change color sliders to NO to track light
        isColorSliders = NO;
    }
    else if (button.tag == 5)
    {
        // Pop buttons
        slider1HighlightContrast.hidden = YES;
        slider2ShadowBrightness.hidden = YES;
        slider3VibranceSaturation.hidden = YES;
        antiquePop.hidden = NO;
        blackAndWhitePop.hidden = NO;
        slider1Label.hidden = YES;
        slider2Label.hidden = YES;
        slider3Label.hidden = YES;
        
    }
    else if ((button.tag == 6) || (button.tag == 7))
    {
        // Get the current image and change it to a CIImage
        CIImage* filteringImage = [[CIImage alloc] initWithCGImage:croppedImage.CGImage];
        // Set the image context
        imageContext = [CIContext contextWithOptions:nil];
        
        // IMAGE EFFECT FILTERS
        
        CIFilter* filter;
        if (button.tag == 6) {
            filter = [CIFilter filterWithName:@"CIPhotoEffectChrome" keysAndValues:kCIInputImageKey,filteringImage, nil];
            // CIPhotoEffectChrome (Vintage color pop)
            /*
             CIAttributeFilterDisplayName = "Photo Effect Chrome";
             CIAttributeFilterName = CIPhotoEffectChrome;
             inputImage =     {
             CIAttributeClass = CIImage;
             CIAttributeType = CIAttributeTypeImage;
             };
             */
        }
        else if (button.tag == 7)
        {
            filter = [CIFilter filterWithName:@"CIPhotoEffectNoir" keysAndValues:kCIInputImageKey,filteringImage, nil];
            //CIPhotoEffectNoir (Black and White POP)
            /*
             CIAttributeFilterDisplayName = "Photo Effect Noir";
             CIAttributeFilterName = CIPhotoEffectNoir;
             inputImage =     {
             CIAttributeClass = CIImage;
             CIAttributeType = CIAttributeTypeImage;
             };
             */
        }
        
        CIImage* returnImage = [filter outputImage];
        
        // Create the new image with the filter changes
        CGImageRef createdNewImage = [imageContext createCGImage:returnImage
                                                        fromRect:[returnImage extent]];
        // Create the new updated image
        UIImage* updatedImage = [UIImage imageWithCGImage:createdNewImage];
        
        // Set the new edited image to the imageview
        finalImage.image = updatedImage;
        // release the previous edit
        CGImageRelease(createdNewImage);

    }
}

// Save video to album
- (void)video: (NSString *) videoPath didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if (error == nil)
    {
        // Alert user the movie saved correctly
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Movie Saved!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"%@", error);
        NSDictionary* errorDictionary = [error userInfo];
        // Parse the dictionary and get the value of the NsLocalizedDescription
        NSString* errorFound = [errorDictionary objectForKey:@"NSLocalizedDescription"];
        // Alert user there was a problem
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Whoops!" message:errorFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    // Close view
    [self dismissViewControllerAnimated:true completion:nil];
}

// save image to album
-(void)image: (UIImage*) image didFinishSavingWithError: (NSError*) error contextInfo: (void*) contextInfo
{
    if (error == nil)
    {
        // Alert user the picture saved correctly
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Image Saved!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"%@", error);
        NSDictionary* errorDictionary = [error userInfo];
        // Parse the dictionary and get the value of the NsLocalizedDescription
        NSString* errorFound = [errorDictionary objectForKey:@"NSLocalizedDescription"];
        // Alert user of the error
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:errorFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    // Close the view
    [self dismissViewControllerAnimated:true completion:nil];
}

// FILTER METHODS
// Created actions that pull the updated slider values when each is changed
- (IBAction)highLightSliderChanged:(UISlider* )slider
{
    // set the float value to the slider value
    highlightValue = slider.value;
    NSLog(@"Value 1 = %f", highlightValue);
    // Update image
    [self getNewImageFromUpdatedSliderValues];
}

- (IBAction)shadowSliderChanged:(UISlider* )slider
{
    shadowValue = slider.value;
    NSLog(@"Value 2 = %f", shadowValue);
    [self getNewImageFromUpdatedSliderValues];
}

- (IBAction)vibranceSliderChanged:(UISlider* )slider
{
    vibranceValue = slider.value;
    NSLog(@"Value 3 = %f", vibranceValue);
    [self getNewImageFromUpdatedSliderValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getNewImageFromUpdatedSliderValues
{
    // Get the current slider values
    float highLight = highlightValue;
    float shadow = shadowValue;
    float vibrance = vibranceValue;
    
    // Get the current image and change it to a CIImage
    CIImage* filteringImage = [[CIImage alloc] initWithCGImage:croppedImage.CGImage];
    // Set the image context
    imageContext = [CIContext contextWithOptions:nil];
    
    // Pass the updated values to change the photo with the filter stack adjustments
    CIImage* outputImage = [self previousPhoto:filteringImage value1:highLight value2:shadow value3:vibrance];
    
    // Create the new image with the filter changes
    CGImageRef createdNewImage = [imageContext createCGImage:outputImage
                                               fromRect:[outputImage extent]];
    // Create the new updated image
    UIImage* updatedImage = [UIImage imageWithCGImage:createdNewImage];
    
    // Set the new edited image to the imageview
    finalImage.image = updatedImage;
    // release the previous edit
    CGImageRelease(createdNewImage);
}


// Apply filters to image
-(CIImage*)previousPhoto:(CIImage*)image value1:(float)value1 value2:(float)value2 value3:(float)value3
{
    // Check if sliders are set to color or light controls
    if (isColorSliders == YES)
    {
        // run color filters
        // COLOR FILTERS
        /*
         CIAttributeFilterDisplayName = "Color Controls";
         CIAttributeFilterName = CIColorControls;
         inputBrightness =     {
         CIAttributeClass = NSNumber;
         CIAttributeDefault = 0;
         CIAttributeIdentity = 0;
         CIAttributeSliderMax = 1;
         CIAttributeSliderMin = "-1";
         CIAttributeType = CIAttributeTypeScalar;
         };
         inputContrast =     {
         CIAttributeClass = NSNumber;
         CIAttributeDefault = 1;
         CIAttributeIdentity = 1;
         CIAttributeSliderMax = 4;
         CIAttributeSliderMin = 0;
         CIAttributeType = CIAttributeTypeScalar;
         };
         inputImage =     {
         CIAttributeClass = CIImage;
         CIAttributeType = CIAttributeTypeImage;
         };
         
         inputSaturation =     {
         CIAttributeClass = NSNumber;
         CIAttributeDefault = 1;
         CIAttributeIdentity = 1;
         CIAttributeSliderMax = 2;
         CIAttributeSliderMin = 0;
         CIAttributeType = CIAttributeTypeScalar;
         };
         */
        
        // Create Color Filter
        CIFilter* color = [CIFilter filterWithName:@"CIColorControls"];
        [color setValue:image forKey:kCIInputImageKey];
        // Set the brightness, contrast, and saturation
        [color setValue:@(value1) forKey:@"inputContrast"]; // slider max = 4
        [color setValue:@(value2) forKey:@"inputBrightness"]; // Slider default same
        [color setValue:@(value3) forKey:@"inputSaturation"];
        return color.outputImage;

        
    }
    else if (isColorSliders == NO)
    {
        // HIGHLIGHT & SHADOW FILTER
        // Create the filter
        CIFilter* highlight = [CIFilter filterWithName:@"CIHighlightShadowAdjust"];
        // Set image to apply it on
        [highlight setValue:image forKey:kCIInputImageKey];
        // set the highlight and shadow levels from the sliders
        [highlight setValue:@(value1) forKey:@"inputHighlightAmount"];
        [highlight setValue:@(value2)forKey:@"inputShadowAmount"];
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
        [vibrance setValue:highlight.outputImage forKey:kCIInputImageKey];
        [vibrance setValue:@(value3) forKey:@"inputAmount"];
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
        
        // LIGHT FILTERS
        // CIExposureAdjust
        /*
         CIAttributeFilterDisplayName = "Exposure Adjust";
         CIAttributeFilterName = CIExposureAdjust;
         inputEV =     {
         CIAttributeClass = NSNumber;
         CIAttributeDefault = 0;
         CIAttributeIdentity = 0;
         CIAttributeSliderMax = 10;
         CIAttributeSliderMin = "-10";
         CIAttributeType = CIAttributeTypeScalar;
         };
         inputImage =     {
         CIAttributeClass = CIImage;
         CIAttributeType = CIAttributeTypeImage;
         };
         */
        
        // Return the output of the final filter
        return vibrance.outputImage;
    }

    return nil;
}


@end
