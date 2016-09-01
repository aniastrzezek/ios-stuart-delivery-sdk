//
//  StuartDriverDeviceLocation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class StuartDriverDeviceLocation;

typedef NS_ENUM (NSUInteger, StuartDriverDeviceLocationType) {
    StuartDriverDeviceLocationTypeInRangePickin = 2
};

@interface StuartDriverDeviceLocationBuilder : NSObject

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, assign) StuartDriverDeviceLocationType type;
@property (nonatomic, strong) CLLocation *location;

- (StuartDriverDeviceLocation *)build;

@end

@interface StuartDriverDeviceLocation : NSObject

- (instancetype)initWithBuilder:(StuartDriverDeviceLocationBuilder *)builder;

+ (instancetype)driverDeviceLocationWithBlock:(void (^)(StuartDriverDeviceLocationBuilder *))builderBlock;

@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) StuartDriverDeviceLocationType type;
@property (nonatomic, readonly) CLLocation *location;

@end
