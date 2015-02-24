//
//  ActionsTableViewCell.h
//  Engage Your City
//
//  Created by Angela Smith on 6/20/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//  create and animate a circle http://stackoverflow.com/questions/10809280/drawrect-circle-and-animate-size-color

#import <UIKit/UIKit.h>

@interface ActionsTableViewCell : UITableViewCell
{
    IBOutlet UIImageView* eventCompletionImage;
}
@property (nonatomic, strong) IBOutlet UILabel* eventName;
@property (nonatomic, strong) IBOutlet UILabel* eventSubtitle;

@end
