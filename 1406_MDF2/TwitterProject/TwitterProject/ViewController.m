//
//  ViewController.m
//  TwitterProject
//
//  Created by Angela Smith on 6/2/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import "TwitterCustomObject.h"
#import "TweetListTableViewCell.h"
#import "TweetDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Create an instance of the accountstore
    ACAccountStore * accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        // query the account and get it's type (twitter/facebook)
        // First tell it what kind of account type we are looking for
        ACAccountType* accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            // ask for access
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                // code block passed when the request is granted or blocked
                if (granted)
                {
                    // Yea! We got in! Now get all the accounts
                    twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil)
                    {
                        // This will pull thek first account (if they have multiple, pop up a tableview to allow them to select one. Then use the index to get that information)
                        if (twitterAccounts.count == 0)
                        {
                            // Display an alertview
                        }
                        else
                        {
                            // Set the current account to the first
                            currentAccount = [twitterAccounts objectAtIndex:1];
                            [self refreshTwitter];
                        }
                        //NSLog(@"Current account = %@", currentAccount);
                        
                    }
                }
                else // if account request is denied or errors
                {
                    // We were denied access, create an alert to check connected
                }
            }];
        }
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)refreshTwitter
{
    tweetObjects = [[NSMutableArray alloc] init];
    if (currentAccount != nil)
    {
        // set the request url
        NSString* requestedUrlString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
        // Create the social request
        
        SLRequest* request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestedUrlString] parameters:nil];
        // parameters are for any details you want (user id..)
        // The request will pull the logged in user's info, if we want another user then we would pass that id as a parameter.
        // Authenticate the request
        [request setAccount:currentAccount];
        // Perform the request
        [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
            // There are no parameters sent in, but it does return a responce or an error
            if ((error == nil) && ([urlResponse statusCode] == 200))
            {
                // This says, if there were no errors, and the responce says "everything is OK"
                //NSLog(@"Responce = %@", responseData);
                // Convert this data to JSON through serialization
                NSArray* twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                // Check out the JSON responce data
                //NSLog(@"Twitter Feed = %@", twitterFeed);
                // Always check to see how this should be received (Array or other)
                
                // Create a dictionary to hold the first one
                //NSDictionary* firstTweet = [twitterFeed objectAtIndex:0];
                //NSLog(@"Twitter Feed = %@", firstTweet.description);
                for (NSDictionary* tweet in twitterFeed) {
                    // NSDictionary* text = tweet[@"text"];
                    TwitterCustomObject* tweetInfo = [[TwitterCustomObject alloc] init];
                    // Save the text
                    tweetInfo.tweetText = tweet[@"text"];
                    //NSLog(@"%@", tweetInfo.tweetText);
                    //NSLog(@"%@", tweet[@"retweeted"]);
                    
                    
                    // FORMAT THE DATE
                    // Ititialize the formatter
                    NSDateFormatter* changeDateFormat = [[NSDateFormatter alloc] init];
                    // Set Twitters date format
                    [changeDateFormat setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
                    // Pull this tweet's date
                    NSString* dateString = tweet[@"created_at"];
                    NSDate* thisDate = [changeDateFormat dateFromString:dateString];
                    // Set the new format
                    [changeDateFormat setDateFormat:@"EEE, MMM d, ''yy"];
                    // Turn the new date into a string
                    NSString* formatedDate = [changeDateFormat stringFromDate:thisDate];
                    // Set the date to the object
                    tweetInfo.tweetDate = formatedDate;
                    // Add the object to the mutable array
                    
                    // CHECK FOR RETWEET
                    NSString* retweetString = tweet[@"retweeted"];
                    NSInteger retweetNum = [retweetString integerValue];
                    tweetInfo.tweetStatus = retweetNum;
                    
                    // SET THE IMAGE
                    if (retweetNum == 0) {
                        NSLog(@"Status is 0");
                        // This is not retweeted
                        tweetInfo.retweetImageName = [UIImage imageNamed:@"white.png"];
                        //tweetInfo.tweetImageName = @"white.png";
                    } else if (retweetNum > 0) {
                        NSLog(@"Status is 1");
                        tweetInfo.retweetImageName = [UIImage imageNamed:@"blue.png"];
                        //tweetInfo.tweetImageName = @"blue.png";
                    }
                    
                    [tweetObjects addObject:tweetInfo];
                }
                [tweetsTableView reloadData];
                NSLog(@"%@", tweetObjects.description);
            }
        }];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tweetObjects.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetListTableViewCell* twitterCell = [tableView dequeueReusableCellWithIdentifier:@"tweetList"];
    TwitterCustomObject* thisTweet = [tweetObjects objectAtIndex:indexPath.row];
    [twitterCell refreshTwitterFeed:thisTweet.tweetText tweetDate:thisTweet.tweetDate retweetImage:thisTweet.retweetImageName];
    
    //[twitterCell refreshTwitterFeed:thisTweet.tweetText tweetDate:thisTweet.tweetDate retweetImage:thisTweet]
    //cell.tweetLineText.text = thisTweet.tweetText;
    //cell.tweetLineDate.text = thisTweet.tweetDate;
    // Set the image
    //cell.tweetImage = [UIImage imageNamed:thisTweet.tweetImageName];

    return twitterCell;
}

// Pass the Twitter object to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Set the view controller
    TweetDetailViewController* tweetDetailVC = segue.destinationViewController;
    if (tweetDetailVC != nil) {
        UITableViewCell* thisTwitterCell = (UITableViewCell*)sender;
        // Set the index path to the cell that is sending it
        NSIndexPath* indexPath = [tweetsTableView indexPathForCell:thisTwitterCell];
        TwitterCustomObject* thisTweet = [tweetObjects objectAtIndex:indexPath.row];
        // Set this data in the next VC
        tweetDetailVC.currentTweet = thisTweet;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
