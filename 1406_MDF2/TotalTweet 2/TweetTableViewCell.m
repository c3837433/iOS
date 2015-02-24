//
//  TweetTableViewCell.m
//  TotalTweet
//
//  Created by Angela Smith on 6/7/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "TweetTableViewCell.h"

@implementation TweetTableViewCell
@synthesize tweetImage, tweetLineDate, tweetLineText;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

// Refresh the Twitter feed
-(void)refreshTwitterFeed:(NSString*) tweetText tweetDate:(NSString*) tweetDate retweetImage:(UIImage*)retweetImage
{
    // Set the arguments
    tweetLineText.text = tweetText;
    tweetLineDate.text = tweetDate;
    tweetImage.image = retweetImage;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
