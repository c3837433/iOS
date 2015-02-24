//
//  SelectAccountViewController.m
//  TwitterPractice
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "SelectAccountViewController.h"
#import "AppDelegate.h"

@interface SelectAccountViewController ()

@end

@implementation SelectAccountViewController
@synthesize loadingIndicator;


- (void)viewDidLoad
{
    // Access the delegate to set the account number
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    // Initialize the array to hold the posts
    //tweetObjects = [[NSMutableArray alloc] init];
    
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
                     NSLog(@"There are %lu accounts.", (unsigned long)twitterAccounts.count);
                     // CHECK HOW MANY ACCOUNTS THERE ARE
                     if (twitterAccounts.count > 1)
                     {
                         // Enable the ability to change accounts later
                         //chooseAccountButton.enabled = YES;
                         delegate.changeAccounts = YES;
                         // Select an account
                         [self chooseAccount];
                         
                     }
                     else if (twitterAccounts.count == 0)
                     {
                         // There are no accounts, display an alert and hide account icon
                         //chooseAccountButton.enabled = NO;
                         delegate.changeAccounts = NO;
                     }
                     else
                     {
                         // There is only one account, so use that
                         currentAccount = [twitterAccounts objectAtIndex:0];
                         //chooseAccountButton.enabled = NO;
                         delegate.changeAccounts = NO;
                         // Pull the feed
                       //  [self refreshTwitterFeed];
                     }
                 }
             } // else if error
         }];
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)chooseAccount
{
    //userNameLabel.hidden = YES;
    //tweetsTableView.hidden = YES;
    //chooseAccountLabel.hidden = NO;
    // Start the loading indicator
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
    // Show the account tableView
    accountsTableView.hidden = NO;
    // Display Tableview and hide change icon
    [accountsTableView reloadData];
    currentAccount = [twitterAccounts objectAtIndex:selectedAccountIndex];
    
}


// TABLEVIEW METHODS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return tweetObjects.count;
  //  NSInteger cellCount;
   // if (tableView.tag == 0)
        // This is the accounts tableview
    //{
       // cellCount = twitterAccounts.count;
        
   /* } else if (tableView.tag == 1)
    {
        cellCount = tweetObjects.count;
        //NSLog(@"Cellcount =  %lu", (unsigned long)cellCount);
    }*/
    return twitterAccounts.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if (tableView.tag == 0) {
        // This is the accounts tableview
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"accountListCell"];
        ACAccount* accountsInfo = [twitterAccounts objectAtIndex:[indexPath row]];
        cell.textLabel.text = accountsInfo.username;
        return cell;
    NSLog(@"Tableview should be seen.");
   /* }
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
    */
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // if (tableView.tag == 0)
   // {
        // This is the accounts tableview, find which row was selected
        selectedAccountIndex = indexPath.row;
        // set this as the current account
        currentAccount = [twitterAccounts objectAtIndex:selectedAccountIndex];
        // Hide the tableview
        //accountsTableView.hidden = YES;
        //chooseAccountLabel.hidden = YES;
        //tweetsTableView.hidden = NO;
        //[self refreshTwitterFeed];
   // }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
