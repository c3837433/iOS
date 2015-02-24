//
//  ViewController.h
//  imageEditor
//
//  Created by Angela Smith on 6/12/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView* loadedImage;
    IBOutlet UIImageView* editedImage;
    CIFilter *filter;
    float highLightValue;
    float shadowValue;
    float vibranceValue;
    NSString* urlString;
}
@property (weak, nonatomic) IBOutlet UISlider *highlightSlider;
@property (weak, nonatomic) IBOutlet UISlider *shadowSlider;
@property (weak, nonatomic) IBOutlet UISlider *vibranceSlider;

-(IBAction)highLightSliderChanged:(UISlider *)highlightSlider;
-(IBAction)shadowSliderChanged:(UISlider *)shadowSlider;
-(IBAction)vibranceSliderChanged:(UISlider *)vibranceSlider;
-(IBAction)onLoadCameraClick:(id)sender;


@end
