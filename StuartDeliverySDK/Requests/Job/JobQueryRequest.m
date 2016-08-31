//
//  JobQueryRequest.m
//  StuartDeliverySDK
//
//  Created by ania on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobQueryRequest.h"
#import "StuartConfiguration.h"

@interface JobQueryRequest ()
@property (nonatomic, strong) NSString *jobID;
@end

@implementation JobQueryRequest

- (instancetype)initWithJobID:(NSString *)jobID {
    self = [super init];
    
    if (self) {
        self.jobID = jobID;
    }
    return self;
}

- (NSURL *)url {
    return [[StuartConfiguration sharedConfiguration].jobURL URLByAppendingPathComponent:self.jobID];
}

- (RequestMethod)method {
    return RequestMethodGET;
}

- (NSDictionary *)parameters {
    return nil;
}

@end
