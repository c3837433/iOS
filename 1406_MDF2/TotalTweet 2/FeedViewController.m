//
//  FeedViewController.m
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "FeedViewController.h"
#import <Social/Social.h>
#import "CustomTweetObject.h"
#import "TweetTableViewCell.h"
#import "FeedDetailViewController.h"
#import "FeedUserViewController.h"
#import "AppDelegate.h"

@interface FeedViewController ()

@end

@implementation FeedViewController
@synthesize loadingIndicator;

- (void)viewDidLoad
{
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    
    // Initialize the array to hold the posts
    tweetObjects = [[NSMutableArray alloc] init];
    
    // Load the tweets
    [self refreshTwitterFeed];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)refreshTwitterFeed
{
    // Start the loading indicator
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    tweetsTableView.hidden = NO;
    userNameLabel.hidden = YES;
    
    // Access the current account in the AppDelegate
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    /*
    // Check if the user is able to change accounts
    if (delegate.accountsEnabled == NO)
    {
        // If not, hide the button
        chooseAccountButton.hidden = true;
    }
    */
    if (delegate.currentAccount != nil)
    {
        // Create the request string to access the users timeline
        NSString* accessUrlString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
        // Send the request getting the logged in user's twitter timeline
        SLRequest * timelineRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:accessUrlString] parameters:nil];
        
        // Once we get the request, it has to be authenticated
        [timelineRequest setAccount:delegate.currentAccount];
        // Perform the request
        [timelineRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
            // This sends back a valid request or if there is an error (if anything other than nil, something went wrong
            if ((error == nil) && ([urlResponse statusCode] == 200))
            {
                // then everything worked fine
                //NSLog(@"responce = %@", responseData.description);
                // The description returns binary data that needs to be serialized
                NSArray* returnedTwitterFeed =  [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                NSDictionary* firstTweet = [returnedTwitterFeed objectAtIndex:0];
                NSLog(@"Serialied data = %@", firstTweet);
                // Empty the array
                [tweetObjects removeAllObjects];
                // Loop through all the posts and create custom objects with them
                for (NSInteger i=0; i<[returnedTwitterFeed count]; i++)
                {
                    CustomTweetObject* tweetData = [self buildTweetObjectsFromFeed:[returnedTwitterFeed objectAtIndex:i]];
                    // Passing in the dictionary and returning the objects, if they were created correctly, add them to the mutable array of tweets
                    if (tweetData != nil)
                    {
                        [tweetObjects addObject:tweetData];
                    }
                    // Stop the loading indicator
                    [loadingIndicator stopAnimating];
                    loadingIndicator.hidden = YES;
                    // Display the username
                    NSString* username = [NSString stringWithFormat:@"@%@", delegate.currentAccount.username];
                    userNameLabel.text = username;
                    userNameLabel.hidden = NO;
                    [tweetsTableView reloadData];
                }
            } // End got responce
            else if ((error != nil) || ([urlResponse statusCode] != 200))
            {
                // Stop the loading indicator
                [loadingIndicator stopAnimating];
                loadingIndicator.hidden = YES;
                
                NSLog(@"%@", error);
                // Use the error userInfo property to get the returned error in dictionary form
                NSDictionary* errorDictionary = [error userInfo];
                // Parse the dictionary and get the value of the NsLocalizedDescription
                NSString* errorDescription = [errorDictionary objectForKey:@"NSLocalizedDescription"];
                NSLog(@"%@", errorDescription);
                // Create an alert showing the user the problem
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Whoops" message:errorDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
    }
    
}

-(CustomTweetObject*)buildTweetObjectsFromFeed:(NSDictionary*)feedDictionary
{
    // Get the information out of the data
    
    // DATE
    // Ititialize the formatter
    NSDateFormatter* changeDateFormat = [[NSDateFormatter alloc] init];
    // Set Twitters date format
    [changeDateFormat setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    // Pull this tweet's date
    NSString* timeTweetCreated = [feedDictionary valueForKey:@"created_at"];
    NSDate* thisDate = [changeDateFormat dateFromString:timeTweetCreated];
    // Set the new format
    [changeDateFormat setDateFormat:@"EEE, MMM d, yyyy hh:mm aaa"];
    // Turn the new date into a string
    NSString* formatedDate = [changeDateFormat stringFromDate:thisDate];
    // Set the date to the object
    
    // TEXT
    NSString* tweetTextInfo = [feedDictionary valueForKey:@"text"];
    
    // IMAGE
    NSString* retweetString = [feedDictionary valueForKey:@"retweeted"];
    NSInteger retweetNum = [retweetString integerValue];
    // Set the status
    UIImage* tweetImage;
    // SET THE IMAGE
    if (retweetNum == 0) {
        // This is not retweeted
        tweetImage = [UIImage imageNamed:@"white.png"];
    }
    else if (retweetNum > 0)
    {
        // This was retweeted
        tweetImage = [UIImage imageNamed:@"blue.png"];
    }
    
    
    // Create a dictionary to hold the user information
    NSDictionary* userDictionary = [feedDictionary objectForKey:@"user"];
    NSString* userScreenName = [NSString stringWithFormat:@"@%@", [userDictionary objectForKey:@"screen_name"]];
    NSString* userProfilePicUrl = [userDictionary objectForKey:@"profile_image_url"];
    NSString* userDesc = [userDictionary objectForKey:@"description"];
    // Convert the numbers to strings
    NSNumber* userFollowers = [userDictionary objectForKey:@"followers_count"];
    NSString* followers = [userFollowers stringValue];
    NSNumber* userFollowing = [userDictionary objectForKey:@"friends_count"];
    NSString* following = [userFollowing stringValue];
    NSNumber* userPosts = [userDictionary objectForKey:@"statuses_count"];
    NSString* posts = [userPosts stringValue];
    
    // This takes the passed in data, builds an object, and returnsit back to refreshTwitterFeed
    CustomTweetObject* tweetData = [[CustomTweetObject alloc] initTweetObject:userScreenName userDesc:userDesc userPicUrl:userProfilePicUrl date:formatedDate text:tweetTextInfo wasRetweeted:tweetImage postsMade:posts followers:followers following:following];
    
    return tweetData;
}

-(IBAction)onClick:(UIButton*)button
{
    if (button.tag == 0)
    {
        // This is the refresh button
        [self refreshTwitterFeed];
    }
    else if (button.tag == 1)
    {
        // this is the compose button
        SLComposeViewController* sLComposeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        // Add default Text
        [sLComposeVC setInitialText:@"Posted from TwitterFeed!"];
        [self presentViewController:sLComposeVC animated:true completion:nil];
    }
}

-(IBAction)closeView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


// TABLEVIEW METHODS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Display the number of objects returned
    return tweetObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This is the twitterFeed list tableview
    TweetTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"tweetList"];
    // Pull the objects
    CustomTweetObject* thisTweet = [tweetObjects objectAtIndex:indexPath.row];
    // Display the data to the cells
    [cell refreshTwitterFeed:thisTweet.tweetText tweetDate:thisTweet.tweetDate retweetImage:thisTweet.tweetRetweet];
    return cell;
}


// SEGUE INFORMATION
// Pass the Twitter object to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"TweetDetailsSegue"])
    {
        //Set the view controller
        FeedDetailViewController* tweetDetailVC = segue.destinationViewController;
        if (tweetDetailVC != nil) {
            UITableViewCell* thisTwitterCell = (UITableViewCell*)sender;
            // Set the index path to the cell that is sending it
            NSIndexPath* indexPath = [tweetsTableView indexPathForCell:thisTwitterCell];
            CustomTweetObject* thisTweet = [tweetObjects objectAtIndex:indexPath.row];
            // Set this data in the next VC
            tweetDetailVC.currentTweet = thisTweet;
        }
    }
    else if([[segue identifier] isEqualToString:@"UserSegue"])
    {
        //Set the view controller
        FeedUserViewController* userDetailVC = segue.destinationViewController;
        if (userDetailVC != nil) {
            NSLog(@"objects in array %@", tweetObjects.description);
            CustomTweetObject* userInfo = [tweetObjects objectAtIndex:0];
            // Set this data in the next VC
            userDetailVC.currentUserInfo = userInfo;
        }
        
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    // Access the current account in the AppDelegate
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    // Check if the user is able to change accounts
    if (delegate.accountsEnabled == NO)
    {
        // If not, hide the button
        chooseAccountButton.hidden = true;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

