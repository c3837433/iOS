//
//  AccountsViewController.m
//  TotalTweet
//
//  Created by Angela Smith on 6/9/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "AccountsViewController.h"
#import "TweetTableViewCell.h"
#import "FeedViewController.h"
#import "AppDelegate.h"
@interface AccountsViewController ()

@end

@implementation AccountsViewController
@synthesize loadingIndicator;

- (void)viewDidLoad
{
    
    // Set the label text
    loadingSelectLabel.text = @"Loading Twitter Accounts";
    loadingSelectLabel.hidden = NO;
    
    // Find the twitter accounts on the device
    [self getTwitterAccount];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)getTwitterAccount
{
    // Access the AppDelegate to store the currentAccount
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    // Start the Loading indicator
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    
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
                 NSLog(@"There are %lu Twitter accounts", (unsigned long)twitterAccounts.count);
                 
                 // Stop the loading indicator
                 [loadingIndicator stopAnimating];
                 loadingIndicator.hidden = YES;
                 loadingSelectLabel.text = @"Select an Account";
                 
                 // Check how many accounts are on the device
                 // If none, alert the user
                 if (twitterAccounts.count == 0)
                 {
                     // Display an alert to the user informing the user they need a twitter account
                     UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No Account Found" message:@"Huh, we didn't find any Twitter accounts on your device, please add one." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                     [alert show];
                 }
                // if (twitterAccounts != nil)
                 else
                 {
                     // If there is more than one
                     if (twitterAccounts.count > 1)
                     {
                         // Enable the ability to change accounts later
                         delegate.accountsEnabled = YES;
                         // Select an account
                         [self chooseAccount];
                     }
                     
                     else
                     {
                         // There is only one account, so use that
                         delegate.currentAccount = [twitterAccounts objectAtIndex:0];
                         delegate.accountsEnabled = NO;
                         // Allow the user to select the account
                         [self chooseAccount];
                     }
                 }
                
             }
             else // If we are denied access
             {
                 // Display an alert to the user informing them the app needs access to their twitter accounts
                 UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Need Twitter Access" message:@"Oooh, sorry. This app needs access to a Twitter Account." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [alert show];
             }
         }];
    }
}

-(void)chooseAccount
{

    // Start the loading indicator
    [loadingIndicator stopAnimating];
    loadingIndicator.hidden = YES;
    // Show the account tableView
    accountsTableView.hidden = NO;
    // Display Tableview and hide change icon
    [accountsTableView reloadData];
    
}


// TABLEVIEW METHODS
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Set the tableview to the number of twitter accounts
    return twitterAccounts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"accountListCell"];
    // Get the account names and display them with the @ symbol inthe tableview
    ACAccount* accountsInfo = [twitterAccounts objectAtIndex:[indexPath row]];
    NSString* userNameString = [NSString stringWithFormat:@"@%@", accountsInfo.username];
    cell.textLabel.text = userNameString;
    
    return cell;
}

// SEGUE
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    UITableViewCell* selectedAccountCell = (UITableViewCell*)sender;
    // Set the index path to the cell that is sending it
    NSIndexPath* indexPath = [accountsTableView indexPathForCell:selectedAccountCell];
    
    // Access the AppDelegate to store the currentAccount
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    delegate.currentAccount = [twitterAccounts objectAtIndex:indexPath.row];
}

// Remove the selection on when returning to change accounts
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
