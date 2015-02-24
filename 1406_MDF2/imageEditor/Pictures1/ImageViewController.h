//
//  ImageViewController.h
//  Pictures
//
//  Created by Angela Smith on 6/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ImageViewController : UIViewController
{
    IBOutlet UIImageView* startImage;
    IBOutlet UIImageView* finalImage;
    // Slider Vaues
    float highlightValue;
    float shadowValue;
    float vibranceValue;
    CIImage* startingImage;
    CIContext* imageContext;
    CIFilter* imageFilter;
    IBOutlet UIView* photoView;
    IBOutlet UIView* movieView;
    IBOutlet UIButton* antiquePop;
    IBOutlet UIButton* blackAndWhitePop;
    IBOutlet UILabel* slider1Label;
    IBOutlet UILabel* slider2Label;
    IBOutlet UILabel* slider3Label;
    BOOL isColorSliders;
    
}

@property  UIImage* origionalImage;
@property  UIImage* croppedImage;
@property BOOL isImage;
@property NSString* moviePath;

// Slider properties and action methods
@property (weak, nonatomic) IBOutlet UISlider *slider1HighlightContrast;
@property (weak, nonatomic) IBOutlet UISlider *slider2ShadowBrightness;
@property (weak, nonatomic) IBOutlet UISlider *slider3VibranceSaturation;

-(IBAction)highLightSliderChanged:(UISlider *)slider;
-(IBAction)shadowSliderChanged:(UISlider *)slider;
-(IBAction)vibranceSliderChanged:(UISlider *)slider;
@end

