//
//  AppDelegate.h
//  GUITest
//
//  Created by Alex Gray on 6/21/13.
//  Copyright (c) 2013 EXPANZ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "../Source/Main/XcodeEditor.h"

@interface  XCSourceFile (ROOT)
@property (readonly) BOOL isRootGroup;
@property  (readonly) id members;
@end

@interface XCGroup (ChildrenCount)
@property (readonly)NSUInteger childCount;
@end

@interface AppDelegate : NSObject <NSApplicationDelegate, NSOutlineViewDelegate>
@property (assign) IBOutlet NSOutlineView *ov;
@property (assign) IBOutlet NSWindow *window;
@property (strong) NSMutableArray *model;
@property (strong) XCProject *d;

@end
