//
//  ViewController.h
//  PhotPicker
//
//  Created by Angela Smith on 6/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> 
{

    IBOutlet UIImageView* imageView;
    IBOutlet UIImageView* editedImageView;
    CIContext *context;
    CIFilter *filter;
    CIImage *beginImage;
}

@property (nonatomic) IBOutlet UISlider* adjustHighlightsSlider;


@end
