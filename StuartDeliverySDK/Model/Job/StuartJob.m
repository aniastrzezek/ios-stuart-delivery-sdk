//
//  StuartJob.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartJob.h"

@implementation StuartJobBuilder

- (StuartJob *)build {
    return [[StuartJob alloc] initWithBuilder:self];
}

@end


@interface StuartJob ()

@property (nonatomic, copy) NSString *jobID;
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

@implementation StuartJob

- (instancetype)initWithBuilder:(StuartJobBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.jobID = builder.jobID;
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

+ (instancetype)jobWithBlock:(void (^)(StuartJobBuilder *))builderBlock {
    StuartJobBuilder *builder = [StuartJobBuilder new];
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
    
    if (!object || ![object isKindOfClass:[StuartJob class]]) {
        return NO;
    }
    
    return [self isEqualToJob:object];
}

- (BOOL)isEqualToJob:(StuartJob *)job {
    if (self == job) {
        return YES;
    }
    if (job == nil) {
        return NO;
    }
    if (self.jobID != job.jobID && ![self.jobID isEqualToString:job.jobID]) {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash {
    return self.jobID.hash;
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; origin: %@; destination: %@; transportType: %lu;", self.class, self, self.jobID, self.originPlace.address, self.destinationPlace.address, (unsigned long)self.transportType];
    return descriptionString;
}

@end
