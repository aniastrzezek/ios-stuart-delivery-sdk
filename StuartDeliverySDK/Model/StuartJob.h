//
//  StuartJob.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartPlace.h"
#import "StuartCurrency.h"
@class StuartJob;

typedef NS_ENUM(NSUInteger, StuartJobTransportType) {
    StuartJobTransportTypeWalker = 1,
    StuartJobTransportTypeBike,
    StuartJobTransportTypeMotorbike,
    StuartJobTransportTypeCar,
    StuartJobTransportTypeCargobike,
    StuartJobTransportTypeVan
};

@interface StuartJobBuilder : NSObject

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

- (StuartJob *)build;

@end

@interface StuartJob : NSObject <NSCopying>

- (instancetype)initWithBuilder:(StuartJobBuilder *)builder;

+ (instancetype)jobWithBlock:(void (^)(StuartJobBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *jobID;
@property (nonatomic, readonly) StuartPlace *destinationPlace;
@property (nonatomic, readonly) StuartPlace *originPlace;
@property (nonatomic, readonly) StuartJobTransportType transportType;
@property (nonatomic, readonly) NSNumber *distance;
@property (nonatomic, readonly) NSNumber *duration;
@property (nonatomic, readonly) NSNumber *durationWithTraffic;
@property (nonatomic, readonly) BOOL availableCouriers;
@property (nonatomic, readonly) NSNumber *pickupEtaOptimistic;
@property (nonatomic, readonly) NSNumber *pickupEtaPessimistic;
@property (nonatomic, readonly) NSNumber *minPrice;
@property (nonatomic, readonly) NSNumber *basePrice;
@property (nonatomic, readonly) NSNumber *cancellationPrice;
@property (nonatomic, readonly) NSNumber *originalTotalAmount;
@property (nonatomic, readonly) NSNumber *finalTotalAmount;
@property (nonatomic, readonly) StuartCurrency *currency;
@property (nonatomic, readonly) NSString *polyline;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *expireAt;

@end
