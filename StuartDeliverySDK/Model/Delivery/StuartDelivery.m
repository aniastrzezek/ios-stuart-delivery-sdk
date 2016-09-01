//
//  StuartDelivery.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartDelivery.h"

@implementation StuartDeliveryBuilder

- (StuartDelivery *)build {
    return [[StuartDelivery alloc] initWithBuilder:self];
}

@end

@interface StuartDelivery ()

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

@end

@implementation StuartDelivery

- (instancetype)initWithBuilder:(StuartDeliveryBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.deliveryID = builder.deliveryID;
        self.driver = builder.driver;
        self.status = builder.status;
        self.lastDeliveryStatus = builder.lastDeliveryStatus;
        self.deliveryStatusDelivered = builder.deliveryStatusDelivered;
        self.deliveryStatusPicked = builder.deliveryStatusPicked;
        self.estimatedDistanceToDestination = builder.estimatedDistanceToDestination;
        self.estimatedDistanceToOrigin = builder.estimatedDistanceToOrigin;
        self.etaToDestination = builder.etaToDestination;
        self.etaToOrigin = builder.etaToOrigin;
        self.originalEtaToDestination = builder.originalEtaToDestination;
        self.originalEtaToOrigin = builder.originalEtaToOrigin;
        self.transportType = builder.transportType;
        self.traveledToOriginDistance = builder.traveledToOriginDistance;
        self.suggestedPolylineToDestination = builder.suggestedPolylineToDestination;
        self.suggestedPolylineToOrigin = builder.suggestedPolylineToOrigin;
        self.destinationSignature = builder.destinationSignature;
        self.originSignature = builder.originSignature;
        self.currency = builder.currency;
        self.currentDriverAmount = builder.currentDriverAmount;
        self.finalCompanyAmount = builder.finalCompanyAmount;
        self.finalDriverAmount = builder.finalDriverAmount;
        self.createdAt = builder.createdAt;
        self.updatedAt = builder.updatedAt;
    }
    return self;
}

+ (instancetype)deliveryWithBlock:(void (^)(StuartDeliveryBuilder *))builderBlock {
    StuartDeliveryBuilder *builder = [StuartDeliveryBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
