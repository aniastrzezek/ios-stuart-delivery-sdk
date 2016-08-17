//
//  StuartCity.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "StuartRegion.h"
@class StuartCity;

@interface StuartCityBuilder : NSObject

@property (nonatomic, copy) NSString *cityID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) StuartRegion *region;
@property (nonatomic, copy) NSString *timezone;
@property (nonatomic, copy) CLLocation *location;

- (StuartCity *)build;

@end


@interface StuartCity : NSObject

- (instancetype)initWithBuilder:(StuartCityBuilder *)builder;

+ (instancetype)cityWithBlock:(void (^)(StuartCityBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *cityID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) StuartRegion *region;
@property (nonatomic, readonly) NSString *timezone;
@property (nonatomic, readonly) CLLocation *location;

@end
