//
//  StuartDriver.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartDriver.h"

@implementation StuartDriverBuilder

- (StuartDriver *)build {
    return [[StuartDriver alloc] initWithBuilder:self];
}

@end

@interface StuartDriver ()

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, strong) StuartDriverDeviceLocation *location;

@end

@implementation StuartDriver

- (instancetype)initWithBuilder:(StuartDriverBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.firstname = builder.firstname;
        self.phone = builder.phone;
        self.location = builder.location;
    }
    return self;
}

+ (instancetype)driverWithBlock:(void (^)(StuartDriverBuilder *))builderBlock {
    StuartDriverBuilder *builder = [StuartDriverBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
