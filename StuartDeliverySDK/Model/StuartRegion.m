//
//  StuartRegion.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartRegion.h"

@implementation StuartRegionBuilder

- (StuartRegion *)build {
    return [[StuartRegion alloc] initWithBuilder:self];
}

@end


@interface StuartRegion ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) StuartCountry *country;

@end

@implementation StuartRegion

- (instancetype)initWithBuilder:(StuartRegionBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.name = builder.name;
        self.country = builder.country;
    }
    return self;
}

+ (instancetype)regionWithBlock:(void (^)(StuartRegionBuilder *))builderBlock {
    StuartRegionBuilder *builder = [StuartRegionBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> name: %@;", self.class, self, self.name];
    return descriptionString;
}

@end
