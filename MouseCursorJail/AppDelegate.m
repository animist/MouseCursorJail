//
//  AppDelegate.m
//  MouseCursorJail
//
//  Created by rei on 2012/08/09.
//  Copyright (c) 2012年 rei. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSMouseMovedMask
										   handler:^(NSEvent* event) {
											   //NSLog(@"GlobalMonitor: %@", event);
                                               //
                                               NSPoint point = [NSEvent mouseLocation];
                                               
                                               int width = CGDisplayPixelsWide(kCGDirectMainDisplay);
                                               int height = CGDisplayPixelsHigh(kCGDirectMainDisplay);
                                               
                                               NSLog(@"width : %d", width);
                                               NSLog(@"height : %d", height);
                                               NSLog(@"Point X is here : %f", point.x);
                                               NSLog(@"Point Y is here : %f", point.y);
                                               
                                               float xoffset = width * 0.45;
                                               
                                               float xmin = xoffset;
                                               float xmax = width - xoffset;
                                               
                                               NSLog(@"xmax : %f", xmax);
                                               NSLog(@"xmin : %f", xmin);
                                               if (point.x < xmin) {
                                                   CGDisplayMoveCursorToPoint(kCGDirectMainDisplay, CGPointMake(xmin, height - point.y));
                                               }
                                               if (point.x > xmax) {
                                                   CGDisplayMoveCursorToPoint(kCGDirectMainDisplay, CGPointMake(xmax, height - point.y));
                                               }
                                               
                                               float yoffset = height * 0.45;
                                               
                                               float ymin = yoffset;
                                               float ymax = height - yoffset;
                                               if (point.y < ymin) {
                                                   CGDisplayMoveCursorToPoint(kCGDirectMainDisplay, CGPointMake(point.x, ymax));
                                               }
                                               if (point.y > ymax) {
                                                   CGDisplayMoveCursorToPoint(kCGDirectMainDisplay, CGPointMake(point.x, ymin));
                                               }
										   }];
}

@end
