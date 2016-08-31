//
//  StuartJobStatus.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartUser.h"
#import "StuartDelivery.h"
#import "StuartPlace.h"
#import "StuartJobPrice.h"
#import "StuartJobType.h"
#import "StuartStatus.h"
#import "StuartOrder.h"
#import "StuartPackageType.h"
#import "StuartTransportType.h"
@class StuartJobStatus;

@interface StuartJobStatusBuilder : NSObject

@property (nonatomic, copy) NSString *jobID;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) StuartStatus *lastStatus;
@property (nonatomic, copy) NSString *trackingUrl;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) StuartDelivery *currentDelivery;
@property (nonatomic, strong) StuartTransportType *transportType;
@property (nonatomic, strong) StuartJobPrice *finalJobPrice;

- (StuartJobStatus *)build;

@end

@interface StuartJobStatus : NSObject

- (instancetype)initWithBuilder:(StuartJobStatusBuilder *)builder;

+ (instancetype)jobStatusWithBlock:(void (^)(StuartJobStatusBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *jobID;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) StuartStatus *lastStatus;
@property (nonatomic, readonly) NSString *trackingUrl;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;
@property (nonatomic, readonly) StuartDelivery *currentDelivery;
@property (nonatomic, readonly) StuartTransportType *transportType;
@property (nonatomic, readonly) StuartJobPrice *finalJobPrice;

@end
