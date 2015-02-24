//
//  ViewController.m
//  TwitterFriends
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "ViewController.h"
#import "collectionFriendCustomCell.h"
#import "DetailViewController.h"
#import <Social/Social.h>
#import "TweetFriendsObject.h"
#import "CustomFriendObject.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize loadingIndicator;

- (void)viewDidLoad
{

    // Initialize the twitter friend array
    friendObjects = [[NSMutableArray alloc] init];
    
    [self getTwitterAccount];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)getTwitterAccount
{
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    
    //Initialize the account store
    ACAccountStore* accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        // Get the twitter accounts
        ACAccountType* accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        
        // Stop the loading indicator
        [loadingIndicator stopAnimating];
        loadingIndicator.hidden = YES;
        
        // Request permission to use account
        [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
        {
            // Check if granted or denied
            if (granted)
            {
                // Create an array of the accounts
                twitterAccounts = [accountStore accountsWithAccountType:accountType];
                if (twitterAccounts.count > 0) {
                    currentAccount = [twitterAccounts objectAtIndex:0];
                    //NSLog(@"%@", currentAccount.description);
                    [self refreshFriendList];
                }
            }
            else {
                // Display an alert to the user informing them the app needs access to their twitter accounts
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Need Twitter Access" message:@"Oooh, sorry. This app needs access to a Twitter Account." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
        
    }
}

-(void)refreshFriendList
{
    // Restart the loading indicator
    [loadingIndicator startAnimating];
    loadingIndicator.hidden = NO;
    
    // Create the friend list request string
    NSString* accessFriendsString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
    // Send the request
    SLRequest* friendlistRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:accessFriendsString] parameters:nil];
    // Authenticate the request for the current account
    [friendlistRequest setAccount:currentAccount];
    //Perform the request
    [friendlistRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
    {

        // Check that the request was received correctly
        if ((error == nil) && ([urlResponse statusCode] == 200))
        {
            // Everything is good
            //NSLog(@"responce = %@", responseData.description);
            // Create an array of the retrieved data and parse it
            NSDictionary* returnedFriendInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
            
            NSArray* friends = [returnedFriendInfo objectForKey:@"users"];
            
            //NSDictionary* firstFriend = [returnedFriendInfo objectAtIndex:0];
            //NSLog(@"%@", friends.description);
            if (friends != nil)
            {
                // Check how many friends there are
                if (friends.count == 0)
                {
                    // Alert the user there are no friends to show
                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"This is Awkward.." message:@"You need to find some friends, then we can show them to you!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    // Stop the loading indicator
                    [loadingIndicator stopAnimating];
                    loadingIndicator.hidden = YES;
                    [alert show];
                    
                }
                else
                {
                    // Empty out the array
                    [friendObjects removeAllObjects];
                    // Loop through each one
                    for (NSInteger i=0; i<[friends count]; i++)

                    {
                        // Create an object with the returned friend array
                        CustomFriendObject* friendData = [self createFriendObjectFromData:[friends objectAtIndex:i]];
                        if (friendData != nil)
                        {
                            // Add to the array of friend objects
                            [friendObjects addObject:friendData];
                        }
                        // Stop the loading indicator
                        [loadingIndicator stopAnimating];
                        loadingIndicator.hidden = YES;
                        // Reload table
                        [friendsView reloadData];
                    
                    }
                }
            }
            
            
        } else if ((error != nil) || ([urlResponse statusCode] != 200))
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

-(CustomFriendObject*)createFriendObjectFromData:(NSDictionary*)friendDictionary
{
    // Get the screen name and description
    NSString* userScreenName = [friendDictionary objectForKey:@"screen_name"];
    NSString* userDescription = [friendDictionary objectForKey:@"description"];
    
    // Get the 48X48 image
    NSString* imageUrlString = [friendDictionary objectForKey:@"profile_image_url"];
    //NSLog(@"%@", imageUrlString);
    NSURL* imageUrl = [NSURL URLWithString:imageUrlString];
    UIImage* userImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
    // Get the bigger 73X73 image
    NSString* biggerImageUrl;
    if ([imageUrlString hasSuffix:@"jpeg"])
    {
        // remove the suffix _normal.jpeg
        NSString* changeString = [imageUrlString substringToIndex:[imageUrlString length] - 11];
        //NSLog(@"%@", changeString);
        biggerImageUrl = [NSString stringWithFormat:@"%@bigger.jpeg", changeString];
        //NSLog(@"%@", biggerImageUrl);
    }
    else if ([imageUrlString hasSuffix:@"png"])
    {
        // remove the suffix _normal.png
        NSString* changeString = [imageUrlString substringToIndex:[imageUrlString length] - 10];
        //NSLog(@"%@", changeString);
        biggerImageUrl = [NSString stringWithFormat:@"%@bigger.png", changeString];
        //NSLog(@"%@", biggerImageUrl);
    
    } else if ([imageUrlString hasSuffix:@"jpg"])
    {
        // remove the suffix _normal.png
        NSString* changeString = [imageUrlString substringToIndex:[imageUrlString length] - 10];
        //NSLog(@"%@", changeString);
        biggerImageUrl = [NSString stringWithFormat:@"%@bigger.jpg", changeString];
        //NSLog(@"%@", biggerImageUrl);
    }
    
    NSURL* bigImageUrl = [NSURL URLWithString:biggerImageUrl];
    UIImage* bigUserImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:bigImageUrl]];
    
    // Followers and Friends
    // Convert the numbers to strings
    NSNumber* followers = [friendDictionary objectForKey:@"followers_count"];
    NSString* userFollowers = [followers stringValue];
    NSNumber* posts = [friendDictionary objectForKey:@"listed_count"];
    NSString* userPosts = [posts stringValue];
    
    // Set the data to the object
    CustomFriendObject* friendInfo = [[CustomFriendObject alloc] initWithFriendInfo:userScreenName image:userImage imageBigger:bigUserImage description:userDescription followers:userFollowers tweets:userPosts];
    return friendInfo;
}


// REQUIRED COLLECTIONVIEW METHODS
// Set number of Cells
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return friendObjects.count;
}

// Set Cell Info
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionFriendCustomCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"friendCell" forIndexPath:indexPath];
    if (cell != nil)
    {
        // Get the object data
        CustomFriendObject* thisFriend = [friendObjects objectAtIndex:indexPath.row];
        // Set the friend object data to the collection view cells
        [cell refreshCollectionCellWithFriendInfo:thisFriend.userScreenName friendCellImage:thisFriend.userImageBigger];
        
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Stop the cell from being selected upon return from the detail view
    [collectionView deselectItemAtIndexPath:indexPath animated:true];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the sender cell, and the index path that sent it
    collectionFriendCustomCell* cell = (collectionFriendCustomCell*)sender;
    NSIndexPath* indexPath = [friendsView indexPathForCell:cell];
    // Get this friend object and the destination view controller to sent it to
    CustomFriendObject* thisFriend = [friendObjects objectAtIndex:indexPath.row];
    DetailViewController* detailVC = segue.destinationViewController;
    
    if (detailVC != nil)
    {
        // Set this friend object to the detail view.
        detailVC.thisFriendDetails = thisFriend;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
