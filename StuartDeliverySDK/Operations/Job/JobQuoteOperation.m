//
//  JobQuoteOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobQuoteOperation.h"
#import "JobQuoteRequest.h"
#import "JobsMapper.h"

@implementation JobQuoteOperation

- (instancetype)initWithOrigin:(NSString *)origin destination:(NSString *)destination transportTypes:(NSArray *)transportTypes {
    self = [super init];
    
    if (self) {
        self.request = [[JobQuoteRequest alloc] initWithOrigin:origin destination:destination transportTypes:transportTypes];
    }
    return self;
}

- (void)start {
    [super start];
    [self.networkService requestWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:^(NSDictionary *json, NSError *error) {
        NSArray *jobs = error ? nil : [JobsMapper jobsWithData:json];
        self.completion(jobs, error);
    }];
}


#pragma mark - Setters

- (void)setOriginContactPhone:(NSString *)originContactPhone {
    ((JobQuoteRequest *)self.request).originContactPhone = originContactPhone;
}

- (void)setOriginContactFirstname:(NSString *)originContactFirstname {
    ((JobQuoteRequest *)self.request).originContactFirstname = originContactFirstname;
}

- (void)setOriginContactLastname:(NSString *)originContactLastname {
    ((JobQuoteRequest *)self.request).originContactLastname = originContactLastname;
}

- (void)setOriginContactCompany:(NSString *)originContactCompany {
    ((JobQuoteRequest *)self.request).originContactCompany = originContactCompany;
}

- (void)setOriginContactEmail:(NSString *)originContactEmail {
    ((JobQuoteRequest *)self.request).originContactEmail = originContactEmail;
}

- (void)setDestinationContactPhone:(NSString *)destinationContactPhone {
    ((JobQuoteRequest *)self.request).destinationContactPhone = destinationContactPhone;
}

- (void)setDestinationContactFirstname:(NSString *)destinationContactFirstname {
    ((JobQuoteRequest *)self.request).destinationContactFirstname = destinationContactFirstname;
}

- (void)setDestinationContactLastname:(NSString *)destinationContactLastname {
    ((JobQuoteRequest *)self.request).destinationContactLastname = destinationContactLastname;
}

- (void)setDestinationContactCompany:(NSString *)destinationContactCompany {
    ((JobQuoteRequest *)self.request).destinationContactCompany = destinationContactCompany;
}

- (void)setDestinationContactEmail:(NSString *)destinationContactEmail {
    ((JobQuoteRequest *)self.request).destinationContactEmail = destinationContactEmail;
}

@end
