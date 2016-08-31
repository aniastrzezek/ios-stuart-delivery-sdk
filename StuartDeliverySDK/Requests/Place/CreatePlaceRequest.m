//
//  CreatePlaceRequest.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "CreatePlaceRequest.h"
#import "StuartConfiguration.h"

@interface CreatePlaceRequest ()

@property (nonatomic, assign) StuartPlaceType placeType;
@property (nonatomic, strong) NSString *addressStreet;
@property (nonatomic, strong) NSString *addressPostcode;

@end

@implementation CreatePlaceRequest

- (instancetype)initWithPlaceType:(StuartPlaceType)placeType addressStreet:(NSString *)addressStreet addressPostcode:(NSString *)addressPostcode {
    self = [super init];
    
    if (self) {
        self.placeType = placeType;
        self.addressStreet = addressStreet;
        self.addressPostcode = addressPostcode;
    }
    return self;
}

- (NSURL *)url {
    return [StuartConfiguration sharedConfiguration].createPlaceURL;
}

- (RequestMethod)method {
    return RequestMethodPOST;
}

- (NSDictionary *)parameters {
    NSMutableDictionary *parameters = @{@"placeTypeId": @(self.placeType)}.mutableCopy;
    if (self.addressStreet) {
        parameters[@"addressStreet"] = self.addressStreet;
    }
    if (self.addressPostcode) {
        parameters[@"addressPostcode"] = self.addressPostcode;
    }
    if (self.contactPhone) {
        parameters[@"contactPhone"] = self.contactPhone;
    }
    if (self.contactFirstname) {
        parameters[@"contactFirstname"] = self.contactFirstname;
    }
    if (self.contactLastname) {
        parameters[@"contactLastname"] = self.contactLastname;
    }
    if (self.contactCompany) {
        parameters[@"contactCompany"] = self.contactCompany;
    }
    if (self.contactEmail) {
        parameters[@"contactEmail"] = self.contactEmail;
    }
    if (self.geoPlaceId) {
        parameters[@"geoPlaceId"] = self.geoPlaceId;
    }
    
    return parameters;
}

@end
