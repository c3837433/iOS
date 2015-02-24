//
//  SingleLocationViewController.h
//  project3
//
//  Created by Angela Smith on 3/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
// import the mapkit
#import <MapKit/MapKit.h>
// Add the mapkit delegate
@interface SingleLocationViewController : UIViewController <MKMapViewDelegate>
{
    // Create an outlet for the mapView
    IBOutlet MKMapView * oneLocationMapView;
}
@end
