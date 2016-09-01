//
//  StuartJob.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartJobQuote.h"

@implementation StuartJobQuoteBuilder

- (StuartJobQuote *)build {
    return [[StuartJobQuote alloc] initWithBuilder:self];
}

@end


@interface StuartJobQuote ()

@property (nonatomic, copy) NSString *jobQuoteID;
@property (nonatomic, strong) StuartPlace *destinationPlace;
@property (nonatomic, strong) StuartPlace *originPlace;
@property (nonatomic, assign) StuartJobTransportType transportType;
@property (nonatomic, strong) NSNumber *distance;
@property (nonatomic, strong) NSNumber *duration;
@property (nonatomic, strong) NSNumber *durationWithTraffic;
@property (nonatomic, assign) BOOL availableCouriers;
@property (nonatomic, strong) NSNumber *pickupEtaOptimistic;
@property (nonatomic, strong) NSNumber *pickupEtaPessimistic;
@property (nonatomic, strong) NSNumber *minPrice;
@property (nonatomic, strong) NSNumber *basePrice;
@property (nonatomic, strong) NSNumber *cancellationPrice;
@property (nonatomic, strong) NSNumber *originalTotalAmount;
@property (nonatomic, strong) NSNumber *finalTotalAmount;
@property (nonatomic, strong) StuartCurrency *currency;
@property (nonatomic, copy) NSString *polyline;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *expireAt;

@end

@implementation StuartJobQuote

- (instancetype)initWithBuilder:(StuartJobQuoteBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.jobQuoteID = builder.jobQuoteID;
        self.destinationPlace = builder.destinationPlace;
        self.originPlace = builder.originPlace;
        self.transportType = builder.transportType;
        self.distance = builder.distance;
        self.duration = builder.duration;
        self.durationWithTraffic = builder.durationWithTraffic;
        self.availableCouriers = builder.availableCouriers;
        self.pickupEtaOptimistic = builder.pickupEtaOptimistic;
        self.pickupEtaPessimistic = builder.pickupEtaPessimistic;
        self.minPrice = builder.minPrice;
        self.basePrice = builder.basePrice;
        self.cancellationPrice = builder.cancellationPrice;
        self.originalTotalAmount = builder.originalTotalAmount;
        self.finalTotalAmount = builder.finalTotalAmount;
        self.currency = builder.currency;
        self.polyline = builder.polyline;
        self.createdAt = builder.createdAt;
        self.expireAt = builder.expireAt;
    }
    return self;
}

+ (instancetype)jobWithBlock:(void (^)(StuartJobQuoteBuilder *))builderBlock {
    StuartJobQuoteBuilder *builder = [StuartJobQuoteBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Copying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}


#pragma mark - Equals and hash

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (!object || ![object isKindOfClass:[StuartJobQuote class]]) {
        return NO;
    }
    
    return [self isEqualToJob:object];
}

- (BOOL)isEqualToJob:(StuartJobQuote *)job {
    if (self == job) {
        return YES;
    }
    if (job == nil) {
        return NO;
    }
    if (self.jobQuoteID != job.jobQuoteID && ![self.jobQuoteID isEqualToString:job.jobQuoteID]) {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash {
    return self.jobQuoteID.hash;
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; origin: %@; destination: %@; transportType: %lu;", self.class, self, self.jobQuoteID, self.originPlace.address, self.destinationPlace.address, (unsigned long)self.transportType];
    return descriptionString;
}

@end
