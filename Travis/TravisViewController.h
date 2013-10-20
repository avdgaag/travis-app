//
//  TravisViewController.h
//  Travis
//
//  Created by Arjan van der Gaag on 10/18/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TravisViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

- (void) fetchBuilds;

@property (nonatomic, strong) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progressIndicator;

@end