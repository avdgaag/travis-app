//
//  AppDelegate.m
//  Travis
//
//  Created by Arjan van der Gaag on 10/18/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import "AppDelegate.h"
#import "TravisViewController.h"

@interface AppDelegate()

@property (nonatomic, strong) IBOutlet TravisViewController *travisViewController;

@end

@implementation AppDelegate

// Load the view for Travis into the window and make sure it resizes along with
// the window itself.
- (void)setupViews {
    [self.window.contentView addSubview: self.travisViewController.view];
    self.travisViewController.view.frame = ((NSView *)self.window.contentView).bounds;
    
    [self.window.contentView addConstraint:
      [NSLayoutConstraint constraintWithItem: self.travisViewController.view
                                   attribute: NSLayoutAttributeWidth
                                   relatedBy: NSLayoutRelationEqual
                                      toItem: self.window.contentView
                                   attribute: NSLayoutAttributeWidth
                                  multiplier: 1
                                    constant: 0]];

    [self.window.contentView addConstraint:
      [NSLayoutConstraint constraintWithItem: self.travisViewController.view
                                   attribute: NSLayoutAttributeHeight
                                   relatedBy: NSLayoutRelationEqual
                                      toItem: self.window.contentView
                                   attribute: NSLayoutAttributeHeight
                                  multiplier: 1
                                    constant: 0]];

    [self.travisViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.travisViewController = [[TravisViewController alloc] initWithNibName:@"TravisViewController" bundle:nil];
    [self setupViews];
    [self.travisViewController fetchBuilds];
}

@end
