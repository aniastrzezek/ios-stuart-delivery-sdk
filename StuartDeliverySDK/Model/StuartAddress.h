//
//  StuartAddress.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "StuartCity.h"
@class StuartAddress;

@interface StuartAddressBuilder : NSObject

@property (nonatomic, copy) NSString *addressID;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *postcode;
@property (nonatomic, copy) StuartCity *city;
@property (nonatomic, copy) CLLocation *location;
@property (nonatomic, assign) NSInteger *accuracy;
@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSDate *updatedAt;

- (StuartAddress *)build;

@end


@interface StuartAddress : NSObject

- (instancetype)initWithBuilder:(StuartAddressBuilder *)builder;

+ (instancetype)addressWithBlock:(void (^)(StuartAddressBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *addressID;
@property (nonatomic, readonly) NSString *street;
@property (nonatomic, readonly) NSString *postcode;
@property (nonatomic, readonly) StuartCity *city;
@property (nonatomic, readonly) CLLocation *location;
@property (nonatomic, readonly) NSInteger *accuracy;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;

@end
