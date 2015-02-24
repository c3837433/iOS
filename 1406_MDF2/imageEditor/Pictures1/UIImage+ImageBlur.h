//
//  UIImage+ImageBlur.h
//  Pictures
//
//  Created by Angela Smith on 6/14/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageBlur)

- (UIImage *)applyLightEffect;
- (UIImage *)applyDarkEffect;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
