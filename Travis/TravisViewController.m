//
//  TravisViewController.m
//  Travis
//
//  Created by Arjan van der Gaag on 10/18/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import "TravisViewController.h"
#import "OCTravis.h"
#import "TravisTableCellView.h"

@interface TravisViewController ()

@property (nonatomic, strong) OCTravis *travis;
@property (nonatomic, strong) NSArray *builds;

@end

@implementation TravisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.travis = [[OCTravis alloc] init];
        self.builds = [NSArray array];
    }
    return self;
}

#pragma mark Refresh button

- (IBAction)refreshBuilds:(id)sender {
    [self fetchBuilds];
}

#pragma mark Spinner

- (void)startSpinner {
    [self.progressIndicator startAnimation:self];
}

- (void)stopSpinner {
    [self.progressIndicator stopAnimation:self];
}

- (void) fetchBuilds {
    [self startSpinner];
    [self.travis fetchBuildsForUser:@"avdgaag" withProject:@"rpub" success:^(NSArray *builds) {
        self.builds = builds;
        [self.tableView reloadData];
        [self stopSpinner];
    }];
}

# pragma mark TableView

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return self.builds.count;
}

- (NSView *) tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    TravisTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    NSDictionary *build = [self.builds objectAtIndex:row];
    NSString *title = [NSString stringWithFormat: @"%@ %@", [build objectForKey:@"number"], @"avdgaag/rpub"];
    cellView.repoNameTextField.stringValue = title;
    return cellView;
}

//- (id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    NSDictionary *build = [self.builds objectAtIndex:row];
//    return [build objectForKey: tableColumn.identifier];
//}

@end