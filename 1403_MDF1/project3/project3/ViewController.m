//
//  ViewController.m
//  project3
//
//  Created by Angela Smith on 3/16/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
// import the destination view controllers
#import "SingleLocationViewController.h"
#import "AllLocationsViewController.h"
// import the singleton
#import "LocationsManager.h"
// Import the location data class
#import "LocationData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSLog(@"Loading Page");
    // Create an instance on load
   // [LocationsManager BeginInstanceOnLoad];
    [LocationsManager StartInstance];
    // Build the locations
    LocationData* location1 = [[LocationData alloc] init];
    location1.locationTitle = @"Baul Bunyan Log House";
    location1.locationCoords = CLLocationCoordinate2DMake(43.653352, -93.312337);
    
    LocationData* location2 = [[LocationData alloc] init];
    location2.locationTitle = @"Black Hawk Memorial";
    location2.locationCoords = CLLocationCoordinate2DMake(42.038390, -92.943212);
    
    LocationData* location3 = [[LocationData alloc] init];
    location3.locationTitle = @"Mark Twain's River Raft";
    location3.locationCoords = CLLocationCoordinate2DMake(39.731480, -91.375892);
    
    LocationData* location4 = [[LocationData alloc] init];
    location4.locationTitle = @"Cardinal Towers";
    location4.locationCoords = CLLocationCoordinate2DMake(39.124943, -88.532526);
    
    LocationData* location5 = [[LocationData alloc] init];
    location5.locationTitle = @"Splunking Caverns";
    location5.locationCoords = CLLocationCoordinate2DMake(36.859125, -87.464415);
    
    LocationData* location6 = [[LocationData alloc] init];
    location6.locationTitle = @"Davy Crocket's Range";
    location6.locationCoords = CLLocationCoordinate2DMake(35.649931, -88.882554);
    
    LocationData* location7 = [[LocationData alloc] init];
    location7.locationTitle = @"Kermit's Stage Theatre";
    location7.locationCoords = CLLocationCoordinate2DMake(33.406648, -90.893261);
    
    LocationData* location8 = [[LocationData alloc] init];
    location8.locationTitle = @"Yellowhammer Factory";
    location8.locationCoords = CLLocationCoordinate2DMake(32.413489, -87.031064);
    
    LocationData* location9 = [[LocationData alloc] init];
    location9.locationTitle = @"Soda Pop Pharmacy";
    location9.locationCoords = CLLocationCoordinate2DMake(30.903316, -84.574568);
    
    LocationData* location10 = [[LocationData alloc] init];
    location10.locationTitle = @"Endangered Species Conservatory";
    location10.locationCoords = CLLocationCoordinate2DMake(29.577919, -82.312407);
    
    //LocationsManager * locationManager = [LocationsManager StartInstance];
    // create an array to pass to other array
    NSArray* objectsToPass = [[NSArray alloc] initWithObjects:location1, location2, location3, location4, location5, location6, location7, location8, location9, location10, nil];
    
    [[LocationsManager StartInstance] addObjectsFromArray:objectsToPass];
    NSLog(@"Objects passed");
    //[[LocationsManager StartInstance] addObject:location1];
   
    
    
    
    //[[LocationsManager BeginInstanceOnLoad] addObject: location1];
    
    // Initialize the array with the physics options
    //physicSubjectArray = [[NSMutableArray alloc] initWithObjects:subject1, subject2, subject3, subject4, subject5, subject6, subject7, subject8, subject9, subject10, subject11, subject12, subject13, subject14, subject15, subject16, subject17, subject18, subject19, subject20, nil];
    
    

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Move to next views
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Give segues's identifiers so it knows which is the correct destination
    if ([[segue identifier] isEqualToString:@"SegueToAllLocations"])
    {
        //AllLocationsViewController* allLocationsVC = segue.destinationViewController;
    }
    else if ([[segue identifier] isEqualToString:@"SegueToOneLocation"])
    {
        //SingleLocationViewController* oneLocationsVC = segue.destinationViewController;
    }
}

// TableView Rewuired Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
