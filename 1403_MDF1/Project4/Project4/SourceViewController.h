//
//  SourceViewController.h
//  Project4
//
//  Created by Angela Smith on 3/21/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SourceViewController : UIViewController <NSURLConnectionDataDelegate>
{
    // Create the outlet for the textView
    IBOutlet UITextView* sourceText;
    
    // Define the properties to for our request and source data
    NSURLRequest* urlRequest;
    NSURLConnection* connection;
    NSMutableData* requestedData;
}
@end
