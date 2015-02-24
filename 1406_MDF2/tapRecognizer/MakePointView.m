//
//  MakePointView.m
//  tapRecognizer
//
//  Created by Angela Smith on 6/11/14.
//  Copyright (c) 2014 Angela Smith. All rights reserved.
//

#import "MakePointView.h"

@implementation MakePointView
@synthesize point1, point2;

/*
- (void)setMyPoint:(CGPoint)firstPoint
{
    point1 = firstPoint;
   // point2 = secondPoint;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//---fired when the user finger(s) touches the screen---
-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event
{
    //---get all touches on the screen---
    NSSet *allTouches = [event allTouches];
    
    //---compare the number of touches on the screen---
    switch ([allTouches count])
    {
            switch ([allTouches count])
        {
                //---single touch---
            case 1: {
                
                //---get info of the touch---
                UITouch* touch1 = [[allTouches allObjects] objectAtIndex:0];
                CGPoint pointA = [touch1 locationInView:self];
                NSLog(@"x=%f", pointA.x);
                NSLog(@"y=%f", pointA.y);
            } break;
                
                //---double tap---
            case 2: {
                NSLog(@"Double tap");
                UITouch* touch2 = [[allTouches allObjects] objectAtIndex:1];
                CGPoint pointB = [touch2 locationInView:self];
                NSLog(@"x=%f", pointB.x);
                NSLog(@"y=%f", pointB.y);
                
            } break;
        }
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetRGBFillColor(ctx, 0, 0, 1.0, 1.0);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1.0, 1.0);
    CGRect circlePoint = CGRectMake(point1.x, point1.y, 50.0, 50.0);
    //CGRect circlePoint2 = CGRectMake(point1.x, point1.y, 50.0, 50.0);
    
    CGContextFillEllipseInRect(ctx, circlePoint);
}
*/
- (void) drawCircleAtPoint:(CGPoint)point withRadius:(CGFloat)radius inContext:(CGContextRef)context{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, point.x, point.y, radius, 0, 2*M_PI, YES);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect
{
    CGPoint point;
    CGContextRef context = UIGraphicsGetCurrentContext();
    point.x = self.bounds.origin.x + self.bounds.size.width/2;
    point.y = self.bounds.origin.y + self.bounds.size.height/2;
    CGContextSetLineWidth(context, 5.0);
    [[UIColor whiteColor] setFill];
    [self drawCircleAtPoint:point withRadius:50 inContext:context];
    
}
@end
