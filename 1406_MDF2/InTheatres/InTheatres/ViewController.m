//
//  ViewController.m
//  InTheatres
//
//  Created by Angela Smith on 6/18/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Get access to the device's current location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    // set the accuracy
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Begin gathering location data
    [locationManager startUpdatingLocation];
    
    
    [super viewDidLoad];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
//-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // Get the last location returned in the array
    CLLocation* currentLocation = [locations lastObject];
    currentLatitude = [NSString stringWithFormat:@"%f", currentLocation.coordinate.latitude];
    currentLongitude = [NSString stringWithFormat:@"%f", currentLocation.coordinate.longitude];
    NSLog(@"Current latitude = %@", currentLatitude);
    NSLog(@"Current longitude = %@", currentLongitude);
    
}

- (IBAction)findTheatrea:(id)sender
{
    // Rotten Tomatoes API
    NSString* urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=8m6dnq354vzajskhv9nbbd5v";
    // Fandango API
    //NSString* urlString = @"http://api.fandango.com/v1/?op=theatersbylatlonsearch&lat=44.816428&lon=-93.528625&radius=10&apikey=dcu46fze3zy29xkcxyy7wfnb&sig=af836c62ac446293eacc2853768a54a64396fbbd815a89d014c9cccde2e97e52";
    // Create the request
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    if (urlRequest != nil)
    {
        // Create the conenction
        connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        // Build a mutable data object to hold the returning data
        requestData = [NSMutableData data];
    }
    
    // access key w7xuy5s9x75ttehps3tctxqv
    // access key rotton tomatoes 8m6dnq354vzajskhv9nbbd5v
    // access key fandango dcu46fze3zy29xkcxyy7wfnb
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // If we have valid data returned
    if (data != nil)
    {
        // add the new data to the data object
        [requestData appendData:data];
    }
}
// When Data is done returning
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Convert all the data to a dictionary
    NSDictionary* returnedData = [NSJSONSerialization JSONObjectWithData:requestData options:0 error:nil];
    NSArray* movies = [returnedData objectForKey:@"movies"];
    NSLog(@"There are %lu movies found", (unsigned long)movies.count);
    NSLog(@"%@", movies.description);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
