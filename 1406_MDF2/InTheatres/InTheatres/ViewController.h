//
//  ViewController.h
//  InTheatres
//
//  Created by Angela Smith on 6/18/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, NSURLConnectionDataDelegate>
{
    NSString* currentLatitude;
    NSString* currentLongitude;
    CLLocationManager *locationManager;
    NSURLConnection* connection;
    NSMutableData* requestData;
}
@end
