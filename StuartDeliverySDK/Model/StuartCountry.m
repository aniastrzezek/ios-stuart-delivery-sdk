//
//  StuartCountry.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartCountry.h"

@implementation StuartCountryBuilder

- (StuartCountry *)build {
    return [[StuartCountry alloc] initWithBuilder:self];
}

@end


@interface StuartCountry ()

@property (nonatomic, strong) NSString *countryID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *iso2Code;
@property (nonatomic, strong) StuartCurrency *defaultCurrency;

@end

@implementation StuartCountry

- (instancetype)initWithBuilder:(StuartCountryBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.countryID = builder.countryID;
        self.name = builder.name;
        self.iso2Code = builder.iso2Code;
        self.defaultCurrency = builder.defaultCurrency;
    }
    return self;
}

+ (instancetype)countryWithBlock:(void (^)(StuartCountryBuilder *))builderBlock {
    StuartCountryBuilder *builder = [StuartCountryBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; name: %@;", self.class, self, self.countryID, self.name];
    return descriptionString;
}

@end
