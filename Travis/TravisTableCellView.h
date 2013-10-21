//
//  TravisTableCellView.h
//  Travis
//
//  Created by Arjan van der Gaag on 10/20/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TravisTableCellView : NSTableCellView {
    IBOutlet NSTextField *repoNameTextField;
    IBOutlet NSTextField *durationTextField;
}

@property (assign) NSTextField *repoNameTextField;
@property (assign) NSTextField *durationTextField;

@end
