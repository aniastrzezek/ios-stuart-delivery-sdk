//
//  StuartDelivery.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartCurrency.h"
#import "StuartStatus.h"
#import "StuartDriver.h"
#import "StuartJobQuote.h"
@class StuartDelivery;

@interface StuartDeliveryBuilder : NSObject

@property (nonatomic, copy) NSString *deliveryID;
@property (nonatomic, strong) StuartDriver *driver;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) StuartStatus *lastDeliveryStatus;
@property (nonatomic, strong) StuartStatus *deliveryStatusDelivered;
@property (nonatomic, strong) StuartStatus *deliveryStatusPicked;
@property (nonatomic, strong) NSNumber *estimatedDistanceToDestination;
@property (nonatomic, strong) NSNumber *estimatedDistanceToOrigin;
@property (nonatomic, strong) NSDate *etaToDestination;
@property (nonatomic, strong) NSDate *etaToOrigin;
@property (nonatomic, strong) NSDate *originalEtaToDestination;
@property (nonatomic, strong) NSDate *originalEtaToOrigin;
@property (nonatomic, assign) StuartJobTransportType transportType;
@property (nonatomic, strong) NSNumber *traveledToOriginDistance;
@property (nonatomic, copy) NSString *suggestedPolylineToDestination;
@property (nonatomic, copy) NSString *suggestedPolylineToOrigin;
@property (nonatomic, copy) NSString *destinationSignature;
@property (nonatomic, copy) NSString *originSignature;
@property (nonatomic, strong) StuartCurrency *currency;
@property (nonatomic, assign) NSInteger currentDriverAmount;
@property (nonatomic, strong) NSNumber *finalCompanyAmount;
@property (nonatomic, strong) NSNumber *finalDriverAmount;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;

- (StuartDelivery *)build;

@end

@interface StuartDelivery : NSObject

- (instancetype)initWithBuilder:(StuartDeliveryBuilder *)builder;

+ (instancetype)deliveryWithBlock:(void (^)(StuartDeliveryBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *deliveryID;
@property (nonatomic, readonly) StuartDriver *driver;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) StuartStatus *lastDeliveryStatus;
@property (nonatomic, readonly) StuartStatus *deliveryStatusDelivered;
@property (nonatomic, readonly) StuartStatus *deliveryStatusPicked;
@property (nonatomic, readonly) NSNumber *estimatedDistanceToDestination;
@property (nonatomic, readonly) NSNumber *estimatedDistanceToOrigin;
@property (nonatomic, readonly) NSDate *etaToDestination;
@property (nonatomic, readonly) NSDate *etaToOrigin;
@property (nonatomic, readonly) NSDate *originalEtaToDestination;
@property (nonatomic, readonly) NSDate *originalEtaToOrigin;
@property (nonatomic, readonly) StuartJobTransportType transportType;
@property (nonatomic, readonly) NSNumber *traveledToOriginDistance;
@property (nonatomic, readonly) NSString *suggestedPolylineToDestination;
@property (nonatomic, readonly) NSString *suggestedPolylineToOrigin;
@property (nonatomic, readonly) NSString *destinationSignature;
@property (nonatomic, readonly) NSString *originSignature;
@property (nonatomic, readonly) StuartCurrency *currency;
@property (nonatomic, readonly) NSInteger currentDriverAmount;
@property (nonatomic, readonly) NSNumber *finalCompanyAmount;
@property (nonatomic, readonly) NSNumber *finalDriverAmount;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;

@end
