//
//  StuartCurrency.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartCurrency.h"

@implementation StuartCurrencyBuilder

- (StuartCurrency *)build {
    return [[StuartCurrency alloc] initWithBuilder:self];
}

@end


@interface StuartCurrency ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, copy) NSString *isoCode;
@property (nonatomic, strong) NSNumber *rate;

@end

@implementation StuartCurrency

- (instancetype)initWithBuilder:(StuartCurrencyBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.name = builder.name;
        self.symbol = builder.symbol;
        self.isoCode = builder.isoCode;
        self.rate = builder.rate;
    }
    return self;
}

+ (instancetype)currencyWithBlock:(void (^)(StuartCurrencyBuilder *))builderBlock {
    StuartCurrencyBuilder *builder = [StuartCurrencyBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> name: %@; symbol: %@;", self.class, self, self.name, self.symbol];
    return descriptionString;
}


@end
