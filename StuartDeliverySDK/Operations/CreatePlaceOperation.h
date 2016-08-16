//
//  CreatePlaceOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartOperation.h"
#import "StuartPlace.h"

@interface CreatePlaceOperation : StuartOperation

- (instancetype)initWithPlaceType:(StuartPlaceType)placeType addressStreet:(NSString *)addressStreet addressPostcode:(NSString *)addressPostcode;

- (void)setContactPhone:(NSString *)contactPhone;
- (void)setContactFirstname:(NSString *)contactFirstname;
- (void)setContactLastname:(NSString *)contactLastname;
- (void)setContactCompany:(NSString *)contactCompany;
- (void)setContactEmail:(NSString *)contactEmail;
- (void)setGeoPlaceId:(NSString *)geoPlaceId;

@property (nonatomic, strong) void (^completion)(StuartPlace *, NSError *);

@end
