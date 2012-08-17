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
                                               size_t height = CGDisplayPixelsHigh(kCGDirectMainDisplay);
                                               float ymin = 15;
                                               float ymax = height - 15;
                                               if (point.y < ymin) {
                                                   CGDisplayMoveCursorToPoint (kCGDirectMainDisplay, CGPointMake(point.x, ymax));
                                               }
                                               if (point.y > ymax) {
                                                   CGDisplayMoveCursorToPoint (kCGDirectMainDisplay, CGPointMake(point.x, ymin));
                                               }
										   }];
}

@end
