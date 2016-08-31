//
//  JobQueryOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobQueryOperation.h"
#import "JobQueryRequest.h"

@implementation JobQueryOperation

- (instancetype)initWithJobID:(NSString *)jobID {
    self = [super init];
    
    if (self) {
        self.request = [[JobQueryRequest alloc] initWithJobID:jobID];
    }
    return self;
}

- (void)start {
    [super start];
    [self.networkService requestWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:^(NSDictionary *json, NSError *error) {
        //        NSArray *jobs = error ? nil : [JobsMapper jobsWithData:json];
        self.completion(nil, error);
    }];
}

@end
