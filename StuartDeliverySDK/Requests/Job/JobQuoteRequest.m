//
//  JobQuoteRequest.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobQuoteRequest.h"
#import "StuartConfiguration.h"

@interface JobQuoteRequest ()

@property (nonatomic, strong) NSArray *transportTypeIds;
@property (nonatomic, strong) NSString *origin;
@property (nonatomic, strong) NSString *destination;

@end

@implementation JobQuoteRequest

- (instancetype)initWithOrigin:(NSString *)origin destination:(NSString *)destination transportTypes:(NSArray *)transportTypes {
    self = [super init];
    
    if (self) {
        self.transportTypeIds = transportTypes;
        self.origin = origin;
        self.destination = destination;
    }
    return self;
}

- (NSURL *)url {
    return [StuartConfiguration sharedConfiguration].jobQuoteURL;
}

- (RequestMethod)method {
    return RequestMethodPOST;
}

- (NSDictionary *)parameters {
    NSMutableDictionary *parameters = @{@"transportTypeIds": [self.transportTypeIds componentsJoinedByString:@","],
                                        @"origin": self.origin,
                                        @"destination": self.destination}.mutableCopy;
    if (self.originContactPhone) {
        parameters[@"originContactPhone"] = self.originContactPhone;
    }
    if (self.originContactFirstname) {
        parameters[@"originContactFirstname"] = self.originContactFirstname;
    }
    if (self.originContactLastname) {
        parameters[@"originContactLastname"] = self.originContactLastname;
    }
    if (self.originContactCompany) {
        parameters[@"originContactCompany"] = self.originContactCompany;
    }
    if (self.originContactEmail) {
        parameters[@"originContactEmail"] = self.originContactEmail;
    }
    if (self.destinationContactPhone) {
        parameters[@"destinationContactPhone"] = self.destinationContactPhone;
    }
    if (self.destinationContactFirstname) {
        parameters[@"destinationContactFirstname"] = self.destinationContactFirstname;
    }
    if (self.destinationContactLastname) {
        parameters[@"destinationContactLastname"] = self.destinationContactLastname;
    }
    if (self.destinationContactCompany) {
        parameters[@"destinationContactCompany"] = self.destinationContactCompany;
    }
    if (self.destinationContactEmail) {
        parameters[@"destinationContactEmail"] = self.destinationContactEmail;
    }
    
    return parameters;
}


@end
