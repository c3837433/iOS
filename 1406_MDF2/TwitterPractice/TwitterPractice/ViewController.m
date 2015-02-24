//
//  ViewController.m
//  TwitterPractice
//
//  Created by Angela Smith on 6/4/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import "CustomTweetsObject.h"
#import "TweetTableViewCell.h"
#import "TweetDetailViewController.h"
#import "UserDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize loadingIndicator;
- (void)viewDidLoad
{
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    // Initialize the array to hold the posts
    tweetObjects = [[NSMutableArray alloc] init];
    
    // Initialize the account store
    ACAccountStore* accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        ACAccountType* accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        // Ask the store for access to the twitter account
        [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
         {
             // granted = we got in, error = problem or denial of acces
             if (granted)
             {
                 // Create an array of all the accounts that match our type (now, twitter)
                 twitterAccounts = [accountStore accountsWithAccountType:accountType];
                 
                 // Stop the loading indicator
                 [loadingIndicator stopAnimating];
                 loadingIndicator.hidden = YES;
                 
                 if (twitterAccounts != nil)
                 {
                     
                     // CHECK HOW MANY ACCOUNTS THERE ARE
                     if (twitterAccounts.count > 1)
                     {
                         // Enable the ability to change accounts later
                         chooseAccountButton.enabled = YES;
                         // Select an account
                         [self chooseAccount];
                         
                     }
                     else if (twitterAccounts.count == 0)
                     {
                         // There are no accounts, display an alert and hide account icon
                         chooseAccountButton.enabled = NO;
                     }
                     else
                     {
                         // There is only one account, so use that
                         currentAccount = [twitterAccounts objectAtIndex:0];
                         chooseAccountButton.enabled = NO;
                         // Pull the feed
                         [self refreshTwitterFeed];
                     }
                 }
             } // else if error
         }];
    }
    
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
    
    if (currentAccount != nil)
    {
        // Create the request string to access the users timeline
        NSString* accessUrlString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
        // Send the request getting the logged in user's twitter timeline
        SLRequest * timelineRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:accessUrlString] parameters:nil];
                         
        // Once we get the request, it has to be authenticated
        [timelineRequest setAccount:currentAccount];
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
                CustomTweetsObject* tweetData = [self buildTweetObjectsFromFeed:[returnedTwitterFeed objectAtIndex:i]];
                // Passing in the dictionary and returning the objects, if they were created correctly, add them to the mutable array of tweets
                if (tweetData != nil)
                {
                    [tweetObjects addObject:tweetData];
                }
            // Stop the loading indicator
            [loadingIndicator stopAnimating];
            loadingIndicator.hidden = YES;
            // Display the username
            userNameLabel.text = currentAccount.username;
            userNameLabel.hidden = NO;
            [tweetsTableView reloadData];
            }
        } // End got responce
        else
        {
            // Something went wrong returning the data
        }
        }];
    }
    
}

-(CustomTweetsObject*)buildTweetObjectsFromFeed:(NSDictionary*)feedDictionary
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
    NSString* userScreenName = [userDictionary objectForKey:@"screen_name"];
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
    CustomTweetsObject* tweetData = [[CustomTweetsObject alloc] initTweetObject:userScreenName userDesc:userDesc userPicUrl:userProfilePicUrl date:formatedDate text:tweetTextInfo wasRetweeted:tweetImage postsMade:posts followers:followers following:following];
    
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
    } else if (button.tag == 2)
    {
        // This changes the username
        [self chooseAccount];
    }
}

-(void)chooseAccount
{
    userNameLabel.hidden = YES;
    tweetsTableView.hidden = YES;
    chooseAccountLabel.hidden = NO;
    // Start the loading indicator
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
    // Show the account tableView
    accountsTableView.hidden = NO;
    // Display Tableview and hide change icon
    [accountsTableView reloadData];
    //currentAccount = [twitterAccounts objectAtIndex:selectedAccountIndex];
    
}


// TABLEVIEW METHODS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return tweetObjects.count;
    NSInteger cellCount;
    if (tableView.tag == 0)
        // This is the accounts tableview
    {
        cellCount = twitterAccounts.count;
        
    } else if (tableView.tag == 1)
    {
        cellCount = tweetObjects.count;
        //NSLog(@"Cellcount =  %lu", (unsigned long)cellCount);
    }
    return cellCount;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0) {
        // This is the accounts tableview
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"accountListCell"];
        ACAccount* accountsInfo = [twitterAccounts objectAtIndex:[indexPath row]];
        cell.textLabel.text = accountsInfo.username;
        return cell;
    }
    else if (tableView.tag == 1)
    {
        // This is the twitterFeed list tableview
        TweetTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"tweetList"];
        // Pull the objects
        CustomTweetsObject* thisTweet = [tweetObjects objectAtIndex:indexPath.row];
        // Display the data to the cells
        [cell refreshTwitterFeed:thisTweet.tweetText tweetDate:thisTweet.tweetDate retweetImage:thisTweet.tweetRetweet];
        return cell;
    }
    return nil;
}
                 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0)
    {
    // This is the accounts tableview, find which row was selected
    selectedAccountIndex = indexPath.row;
    // set this as the current account
    currentAccount = [twitterAccounts objectAtIndex:selectedAccountIndex];
    // Hide the tableview
    accountsTableView.hidden = YES;
    chooseAccountLabel.hidden = YES;
    tweetsTableView.hidden = NO;
    [self refreshTwitterFeed];
    }
                     
}

// SEGUE INFORMATION
// Pass the Twitter object to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"TweetDetailsSegue"])
    {
        //Set the view controller
        TweetDetailViewController* tweetDetailVC = segue.destinationViewController;
        if (tweetDetailVC != nil) {
            UITableViewCell* thisTwitterCell = (UITableViewCell*)sender;
            // Set the index path to the cell that is sending it
            NSIndexPath* indexPath = [tweetsTableView indexPathForCell:thisTwitterCell];
            CustomTweetsObject* thisTweet = [tweetObjects objectAtIndex:indexPath.row];
            // Set this data in the next VC
            tweetDetailVC.currentTweet = thisTweet;
        }
    }
    else if([[segue identifier] isEqualToString:@"UserSegue"])
    {
        //Set the view controller
        UserDetailViewController* userDetailVC = segue.destinationViewController;
        if (userDetailVC != nil) {
            NSLog(@"objects in array %@", tweetObjects.description);
            CustomTweetsObject* userInfo = [tweetObjects objectAtIndex:0];
            // Set this data in the next VC
            userDetailVC.currentUserInfo = userInfo;
        }
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
