//
//  StuartCity.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartCity.h"

@implementation StuartCityBuilder

- (StuartCity *)build {
    return [[StuartCity alloc] initWithBuilder:self];
}

@end

@interface StuartCity ()

@property (nonatomic, copy) NSString *cityID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, strong) StuartRegion *region;
@property (nonatomic, copy) NSString *timezone;
@property (nonatomic, strong) CLLocation *location;

@end

@implementation StuartCity

- (instancetype)initWithBuilder:(StuartCityBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.cityID = builder.cityID;
        self.name = builder.name;
        self.code = builder.code;
        self.region = builder.region;
        self.timezone = builder.timezone;
        self.location = builder.location;
    }
    return self;
}

+ (instancetype)cityWithBlock:(void (^)(StuartCityBuilder *))builderBlock {
    StuartCityBuilder *builder = [StuartCityBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; name: %@;", self.class, self, self.cityID, self.name];
    return descriptionString;
}


@end
