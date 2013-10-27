
#import <objc/runtime.h>
#import "AppDelegate.h"

#import <AtoZ/AtoZ.h>


@implementation  XCSourceFile (ROOT)
- (BOOL) isRootGroup { return YES; }
- (NSUInteger) childCount { return 0; }
 - (id) members { return nil; }
@end

@implementation XCGroup (ChildrenCount)

- (NSUInteger) childCount { return self.children.count; }
@end

@implementation AppDelegate
+ (void) load {
	Class selfC = self.class, outC = NSTableView.class;
	SEL highSz = @selector(swizzleHighlightSelectionInClipRect:), 	highS = @selector(highlightSelectionInClipRect:),
		 backSz = @selector(swizzleDrawBackgroundInClipRect:), 		backS = @selector(drawBackgroundInClipRect:),
		 gridSz = @selector(swizzleDrawGridInClipRect), 				gridS = @selector(drawGridInClipRect),
		 drawSz = @selector(swizzleDrawRow:clip:),		 				drawS = @selector(drawRow:clipRect:);


//	[$ swizzleMethod:highS in:outC with:highSz in:selfC];
//	[$ swizzleMethod:backS in:outC with:backSz in:selfC];
//	[$ swizzleMethod:gridS in:outC with:gridSz in:selfC];
//	[$ swizzleMethod:@selector(highlightColorWithFrame:inView:) in:NSCell.class with:@selector(h:iV:) in:self.class];
	[$ swizzleMethod:@selector(drawInteriorWithFrame:inView:) in:NSCell.class with:@selector(d:inV:) in:self.class];
//	[$ swizzleMethod:drawS in:outC with:drawSz in:selfC];
}
-(void)d:(NSR)f inV:(NSView *)c { NSRectFillWithColor(c.bounds, RED); }

-(NSC*)h:(NSR)cellFrame iV:(NSView *)c { return BLACK; }

//- (void) awakeFromNib {  [_ov.tableColumns[0] setDataCell:<#(NSCell *)#>]
- (void)swizzleDrawRow:(NSI)i clip:(NSR)r {
	[RANDOMCOLOR.gradient drawInRect:r angle:-90];
}
- (void)swizzleDrawGridInClipRect:(NSR)rect {
	[[NSBP bezierPathWithRoundedRect:AZInsetRect(rect, 4) cornerRadius:10]strokeWithColor:BLACK andWidth:4];
}
- (void)swizzleDrawBackgroundInClipRect:(NSRect) rect { AZLOGCMD;
	[ORANGEGRAD drawInRect:rect angle:90];
}

- (void)swizzleHighlightSelectionInClipRect:(NSRect) rect { AZLOGCMD;
	[PURPLEGRAD drawInRect:rect angle:-90];
}

// Returns a Boolean that indicates whether a given row should be drawn in the â€œgroup rowâ€ style.
/// If the cell in that row is an instance of NSTextFieldCell and contains only a string value, the â€œgroup rowâ€ style attributes are automatically applie for that cell.

- (BOOL) outlineView: (NSOutlineView *) outlineView
         isGroupItem: (id) item { NSLog(@"item: %@", NSStringFromClass([[item representedObject] class]));
			return [[item representedObject] isKindOfClass:[XCGroup class]];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.d = [XCProject projectWithFilePath:@"/Users/localadmin/Desktop/RoutingHTTPServerFramework/RoutingHTTPServer.xcodeproj"];

//	__block NSMutableArray *models = NSMutableArray.new;
//	[d.files enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//		[models addObject:@{@"name":[obj valueForKey:@"name"]}];
//	}];
//	NSLog(@"%@", models);
//	self.model = models;

	NSLog(@"%@", _d);
	
	// Insert code here to initialize your application
}

@end
