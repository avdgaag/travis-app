//
//  OCTravis.m
//  Travis
//
//  Created by Arjan van der Gaag on 10/18/13.
//  Copyright (c) 2013 orange • cubed. All rights reserved.
//

#import "OCTravis.h"
#import "AFNetworking.h"

@implementation OCTravis

- (void) fetchBuildsForUser:(NSString *)ownerName withProject:(NSString *) name success:(void (^)(NSArray *))block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"https://api.travis-ci.org/repos/%@/%@/builds", ownerName, name];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
