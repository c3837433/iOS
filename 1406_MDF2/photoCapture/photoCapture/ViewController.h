//
//  ViewController.h
//  photoCapture
//
//  Created by Angela Smith on 6/12/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView* loadedImage;
    IBOutlet UIImageView* editedImage;
}
-(IBAction)onClick:(id)sender;
@end
