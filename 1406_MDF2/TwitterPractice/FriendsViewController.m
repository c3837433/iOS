//
//  FriendsViewController.m
//  TwitterPractice
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendDetailsViewController.h"
#import "CustomFriendCollectionCell.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomFriendCollectionCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"friendCell" forIndexPath:indexPath];
    if (cell != nil) {
        //
    }
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
