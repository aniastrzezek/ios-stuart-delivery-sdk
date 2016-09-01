//
//  StuartDeliveryStatus.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartStatus.h"

@implementation StuartStatusBuilder

- (StuartStatus *)build {
    return [[StuartStatus alloc] initWithBuilder:self];
}

@end

@interface StuartStatus ()

@property (nonatomic, copy) NSString *statusID;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, assign) StatusType statusType;
@property (nonatomic, strong) StuartDriverDeviceLocation *driverDeviceLocation;

@end

@implementation StuartStatus

- (instancetype)initWithBuilder:(StuartStatusBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.statusID = builder.statusID;
        self.status = builder.status;
        self.createdAt = builder.createdAt;
        self.statusType = builder.statusType;
        self.driverDeviceLocation = builder.driverDeviceLocation;
    }
    return self;
}

+ (instancetype)deliveryStatusWithBlock:(void (^)(StuartStatusBuilder *))builderBlock {
    StuartStatusBuilder *builder = [StuartStatusBuilder new];
    builderBlock(builder);
    return [builder build];
}


@end
