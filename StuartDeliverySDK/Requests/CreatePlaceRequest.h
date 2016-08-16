//
//  CreatePlaceRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"
#import "StuartPlace.h"

@interface CreatePlaceRequest : NSObject <StuartRequest>

- (instancetype)initWithPlaceType:(StuartPlaceType)placeType addressStreet:(NSString *)addressStreet addressPostcode:(NSString *)addressPostcode;

@property (nonatomic, strong) NSString *contactPhone;
@property (nonatomic, strong) NSString *contactFirstname;
@property (nonatomic, strong) NSString *contactLastname;
@property (nonatomic, strong) NSString *contactCompany;
@property (nonatomic, strong) NSString *contactEmail;
@property (nonatomic, strong) NSString *geoPlaceId;

@end
