//
//  CreatePlaceOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "CreatePlaceOperation.h"
#import "CreatePlaceRequest.h"
#import "PlaceMapper.h"

@implementation CreatePlaceOperation

- (instancetype)initWithPlaceType:(StuartPlaceType)placeType addressStreet:(NSString *)addressStreet addressPostcode:(NSString *)addressPostcode {
    self = [super init];
    
    if (self) {
        self.request = [[CreatePlaceRequest alloc] initWithPlaceType:placeType addressStreet:addressStreet addressPostcode:addressPostcode];
    }
    return self;
}

- (void)start {
    [super start];
    [self.networkService requestWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:^(NSDictionary *json, NSError *error) {
        StuartPlace *place = error ? nil : [PlaceMapper placeWithData:json];
        self.completion(place, error);
    }];
}


#pragma mark - Setters

- (void)setContactPhone:(NSString *)contactPhone {
    ((CreatePlaceRequest *)self.request).contactPhone = contactPhone;
}

- (void)setContactFirstname:(NSString *)contactFirstname {
    ((CreatePlaceRequest *)self.request).contactFirstname = contactFirstname;
}

- (void)setContactLastname:(NSString *)contactLastname {
    ((CreatePlaceRequest *)self.request).contactLastname = contactLastname;
}

- (void)setContactCompany:(NSString *)contactCompany {
    ((CreatePlaceRequest *)self.request).contactCompany = contactCompany;
}

- (void)setContactEmail:(NSString *)contactEmail {
    ((CreatePlaceRequest *)self.request).contactEmail = contactEmail;
}

- (void)setGeoPlaceId:(NSString *)geoPlaceId {
    ((CreatePlaceRequest *)self.request).geoPlaceId = geoPlaceId;
}

@end
