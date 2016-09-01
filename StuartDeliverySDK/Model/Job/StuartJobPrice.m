//
//  StuartJobPrice.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartJobPrice.h"

@implementation StuartJobPriceBuilder

- (StuartJobPrice *)build {
    return [[StuartJobPrice alloc] initWithBuilder:self];
}

@end

@interface StuartJobPrice ()

@property (nonatomic, copy) NSString *jobPriceID;
@property (nonatomic, strong) StuartJobQuote *jobQuote;
@property (nonatomic, strong) NSNumber *basePrice;
@property (nonatomic, strong) NSNumber *cancellationPrice;
@property (nonatomic, strong) NSNumber *finalTotalAmount;
@property (nonatomic, strong) NSNumber *minPrice;
@property (nonatomic, strong) NSNumber *originalTotalAmount;

@end

@implementation StuartJobPrice

- (instancetype)initWithBuilder:(StuartJobPriceBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.jobPriceID = builder.jobPriceID;
        self.jobQuote = builder.jobQuote;
        self.basePrice = builder.basePrice;
        self.cancellationPrice = builder.cancellationPrice;
        self.finalTotalAmount = builder.finalTotalAmount;
        self.minPrice = builder.minPrice;
        self.originalTotalAmount = builder.originalTotalAmount;
    }
    return self;
}

+ (instancetype)jobPriceWithBlock:(void (^)(StuartJobPriceBuilder *))builderBlock {
    StuartJobPriceBuilder *builder = [StuartJobPriceBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
