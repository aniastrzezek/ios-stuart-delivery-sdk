//
//  StuartDriverDeviceLocation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartDriverDeviceLocation.h"

@implementation StuartDriverDeviceLocationBuilder

- (StuartDriverDeviceLocation *)build {
    return [[StuartDriverDeviceLocation alloc] initWithBuilder:self];
}

@end

@interface StuartDriverDeviceLocation ()

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, assign) StuartDriverDeviceLocationType type;
@property (nonatomic, strong) CLLocation *location;

@end

@implementation StuartDriverDeviceLocation

- (instancetype)initWithBuilder:(StuartDriverDeviceLocationBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.createdAt = builder.createdAt;
        self.type = builder.type;
        self.location = builder.location;
    }
    return self;
}

+ (instancetype)driverDeviceLocationWithBlock:(void (^)(StuartDriverDeviceLocationBuilder *))builderBlock {
    StuartDriverDeviceLocationBuilder *builder = [StuartDriverDeviceLocationBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
