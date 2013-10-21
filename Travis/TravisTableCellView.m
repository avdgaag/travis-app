//
//  TravisTableCellView.m
//  Travis
//
//  Created by Arjan van der Gaag on 10/20/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import "TravisTableCellView.h"

@implementation TravisTableCellView

@synthesize repoNameTextField;
@synthesize durationTextField;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

@end
