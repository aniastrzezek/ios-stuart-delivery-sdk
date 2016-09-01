//
//  StuartDriver.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartDriverDeviceLocation.h"
@class StuartDriver;

@interface StuartDriverBuilder : NSObject

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, strong) StuartDriverDeviceLocation *location;

- (StuartDriver *)build;

@end

@interface StuartDriver : NSObject

- (instancetype)initWithBuilder:(StuartDriverBuilder *)builder;

+ (instancetype)driverWithBlock:(void (^)(StuartDriverBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *firstname;
@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) StuartDriverDeviceLocation *location;

@end
