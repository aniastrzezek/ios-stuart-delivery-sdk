//
//  StuartDeliveryStatus.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartDriverDeviceLocation.h"
@class StuartStatus;

typedef NS_ENUM (NSUInteger, StatusType) {
    StatusTypeNew = 1,
    StatusTypeDelivering = 2,
    StatusTypeInProgress = 3
};

@interface StuartStatusBuilder : NSObject

@property (nonatomic, copy) NSString *statusID;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, assign) StatusType statusType;
@property (nonatomic, strong) StuartDriverDeviceLocation *driverDeviceLocation;

- (StuartStatus *)build;

@end

@interface StuartStatus : NSObject

- (instancetype)initWithBuilder:(StuartStatusBuilder *)builder;

+ (instancetype)deliveryStatusWithBlock:(void (^)(StuartStatusBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *statusID;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) StatusType statusType;
@property (nonatomic, readonly) StuartDriverDeviceLocation *driverDeviceLocation;

@end