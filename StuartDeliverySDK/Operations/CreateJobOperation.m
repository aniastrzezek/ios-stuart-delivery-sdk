//
//  CreateJobOperation.m
//  StuartDeliverySDK
//
//  Created by ania on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "CreateJobOperation.h"
#import "CreateJobRequest.h"

@implementation CreateJobOperation

- (instancetype)initWithJobQuotID:(NSString *)jobQuoteID {
    self = [super init];
    
    if (self) {
        self.request = [[CreateJobRequest alloc] initWithJobQuotID:jobQuoteID];
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


#pragma mark - Setters

- (void)setComment:(NSString *)comment {
    ((CreateJobRequest *)self.request).comment = comment;
}

- (void)setOriginComment:(NSString *)originComment {
    ((CreateJobRequest *)self.request).originComment = originComment;
}

- (void)setDestinationComment:(NSString *)destinationComment {
    ((CreateJobRequest *)self.request).destinationComment = destinationComment;
}

- (void)setPhoto:(UIImage *)photo {
    ((CreateJobRequest *)self.request).photo = photo;
}

- (void)setClientReference:(NSString *)clientReference {
    ((CreateJobRequest *)self.request).clientReference = clientReference;
}


@end
