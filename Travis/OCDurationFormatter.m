//
//  OCDurationFormatter.m
//  Travis
//
//  Created by Arjan van der Gaag on 10/18/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import "OCDurationFormatter.h"

@implementation OCDurationFormatter

- (NSString *) stringForObjectValue:(id)obj {
    int seconds = (int)[obj integerValue];
    int minutes = seconds / 60;
    int secondsLeft = seconds % 60;
    return [[NSString alloc] initWithFormat: @"%02d:%02d", minutes, secondsLeft];
}

- (BOOL) getObjectValue:(out __autoreleasing id *)obj forString:(NSString *)string errorDescription:(out NSString *__autoreleasing *)error {
    NSArray *parts = [string componentsSeparatedByString: @":"];
    if (parts.count == 2) {
        int minutes = (int)[parts objectAtIndex: 0];
        int seconds = (int)[parts objectAtIndex: 1];
        *obj = [NSNumber numberWithInt: (minutes * 60 + seconds)];
        return YES;
    } else {
        return NO;
    }
}

@end