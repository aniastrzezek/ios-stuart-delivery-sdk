//
//  CreateJobOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "CreateJobOperation.h"
#import "CreateJobRequest.h"
#import "JobStatusMapper.h"

@implementation CreateJobOperation

- (instancetype)initWithJobQuoteID:(NSString *)jobQuoteID {
    self = [super init];
    
    if (self) {
        self.request = [[CreateJobRequest alloc] initWithJobQuoteID:jobQuoteID];
    }
    return self;
}

- (void)start {
    [super startWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:^(NSDictionary *json, NSError *error) {
        StuartJobStatus *jobStatus = [JobStatusMapper jobStatusWithData:json];
        self.completion(jobStatus, error);
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
