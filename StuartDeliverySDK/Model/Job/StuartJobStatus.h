//
//  StuartJobStatus.h
//  StuartDeliverySDK
//
//  Created by ania on 19/08/16.
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

@property (nonatomic, strong) StuartUser *client;
@property (nonatomic, strong) NSDate *clientDesiredArrivalTime;
@property (nonatomic, copy) NSString *clientInvoiceReference;
@property (nonatomic, copy) NSString *clientReference;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) StuartDelivery *currentDelivery;
@property (nonatomic, copy) NSString *destinationComment;
@property (nonatomic, strong) StuartPlace *destinationPlace;
@property (nonatomic, assign) NSInteger expirationInterval;
@property (nonatomic, strong) NSDate *expiresAt;
@property (nonatomic, strong) StuartJobPrice *finalJobPrice;
@property (nonatomic, copy) NSString *jobID;
@property (nonatomic, assign) NSInteger invitationsCount;
@property (nonatomic, copy) NSString *jobCancellation;
@property (nonatomic, assign) StuartJobType *jobType;
@property (nonatomic, strong) NSDate *lastInvitationSentAt;
@property (nonatomic, strong) StuartStatus *lastStatus;
@property (nonatomic, assign) BOOL mandatory;
@property (nonatomic, strong) StuartOrder *order;
@property (nonatomic, copy) NSString *originComment;
@property (nonatomic, strong) StuartPlace *originPlace;
@property (nonatomic, strong) StuartPackageType *packageType;
@property (nonatomic, copy) NSString *picturePath;
@property (nonatomic, assign) BOOL renewable;
@property (nonatomic, strong) NSDate *startInvitingAt;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *trackingUrl;
@property (nonatomic, strong) StuartTransportType *transportType;
@property (nonatomic, strong) NSDate *updatedAt;

- (StuartJobStatus *)build;

@end

@interface StuartJobStatus : NSObject

- (instancetype)initWithBuilder:(StuartJobStatusBuilder *)builder;

+ (instancetype)jobStatusWithBlock:(void (^)(StuartJobStatusBuilder *))builderBlock;

@property (nonatomic, readonly) StuartUser *client;
@property (nonatomic, readonly) NSDate *clientDesiredArrivalTime;
@property (nonatomic, readonly) NSString *clientInvoiceReference;
@property (nonatomic, readonly) NSString *clientReference;
@property (nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) StuartDelivery *currentDelivery;
@property (nonatomic, readonly) NSString *destinationComment;
@property (nonatomic, readonly) StuartPlace *destinationPlace;
@property (nonatomic, readonly) NSInteger *expirationInterval;
@property (nonatomic, readonly) NSDate *expiresAt;
@property (nonatomic, readonly) StuartJobPrice *finalJobPrice;
@property (nonatomic, readonly) NSString *jobID;
@property (nonatomic, readonly) NSInteger *invitationsCount;
@property (nonatomic, readonly) NSString *jobCancellation;
@property (nonatomic, readonly) StuartJobType *jobType;
@property (nonatomic, readonly) NSDate *lastInvitationSentAt;
@property (nonatomic, readonly) StuartStatus *lastStatus;
@property (nonatomic, readonly) BOOL mandatory;
@property (nonatomic, readonly) StuartOrder *order;
@property (nonatomic, readonly) NSString *originComment;
@property (nonatomic, readonly) StuartPlace *originPlace;
@property (nonatomic, readonly) StuartPackageType *packageType;
@property (nonatomic, readonly) NSString *picturePath;
@property (nonatomic, readonly) BOOL renewable;
@property (nonatomic, readonly) NSDate *startInvitingAt;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) NSString *trackingUrl;
@property (nonatomic, readonly) StuartTransportType *transportType;
@property (nonatomic, readonly) NSDate *updatedAt;

@end
