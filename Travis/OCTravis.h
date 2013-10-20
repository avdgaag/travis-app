//
//  OCTravis.h
//  Travis
//
//  Created by Arjan van der Gaag on 10/18/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCTravis : NSObject

- (void) fetchBuildsForUser:(NSString *)ownerName withProject:(NSString *) name success: (void (^)(NSArray *))block;

@end
