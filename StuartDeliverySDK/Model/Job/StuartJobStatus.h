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
#import "StuartStatus.h"
#import "StuartJobQuote.h"
@class StuartJobStatus;

@interface StuartJobStatusBuilder : NSObject

@property (nonatomic, copy) NSString *jobStatusID;
@property (nonatomic, strong) StuartUser *client;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) StuartStatus *lastStatus;
@property (nonatomic, copy) NSString *picturePath;
@property (nonatomic, copy) NSString *trackingUrl;
@property (nonatomic, assign) BOOL mandatory;
@property (nonatomic, assign) BOOL renewable;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSDate *expiresAt;
@property (nonatomic, assign) NSInteger expirationInterval;
@property (nonatomic, strong) StuartDelivery *currentDelivery;
@property (nonatomic, strong) StuartPlace *destinationPlace;
@property (nonatomic, strong) StuartPlace *originPlace;
@property (nonatomic, assign) StuartJobTransportType transportType;
@property (nonatomic, strong) StuartJobPrice *finalJobPrice;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *destinationComment;
@property (nonatomic, copy) NSString *originComment;
@property (nonatomic, copy) NSString *jobCancellation;
@property (nonatomic, strong) NSDate *startInvitingAt;
@property (nonatomic, strong) NSDate *lastInvitationSentAt;
@property (nonatomic, assign) NSInteger invitationsCount;
@property (nonatomic, copy) NSString *clientDesiredArrivalTime;
@property (nonatomic, copy) NSString *clientInvoiceReference;
@property (nonatomic, copy) NSString *clientReference;

- (StuartJobStatus *)build;

@end

@interface StuartJobStatus : NSObject

- (instancetype)initWithBuilder:(StuartJobStatusBuilder *)builder;

+ (instancetype)jobStatusWithBlock:(void (^)(StuartJobStatusBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *jobStatusID;
@property (nonatomic, readonly) StuartUser *client;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic, readonly) StuartStatus *lastStatus;
@property (nonatomic, readonly) NSString *picturePath;
@property (nonatomic, readonly) NSString *trackingUrl;
@property (nonatomic, readonly) BOOL mandatory;
@property (nonatomic, readonly) BOOL renewable;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;
@property (nonatomic, readonly) NSDate *expiresAt;
@property (nonatomic, readonly) NSInteger expirationInterval;
@property (nonatomic, readonly) StuartDelivery *currentDelivery;
@property (nonatomic, readonly) StuartPlace *destinationPlace;
@property (nonatomic, readonly) StuartPlace *originPlace;
@property (nonatomic, readonly) StuartJobTransportType transportType;
@property (nonatomic, readonly) StuartJobPrice *finalJobPrice;
@property (nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) NSString *destinationComment;
@property (nonatomic, readonly) NSString *originComment;
@property (nonatomic, readonly) NSString *jobCancellation;
@property (nonatomic, readonly) NSDate *startInvitingAt;
@property (nonatomic, readonly) NSDate *lastInvitationSentAt;
@property (nonatomic, readonly) NSInteger invitationsCount;
@property (nonatomic, readonly) NSString *clientDesiredArrivalTime;
@property (nonatomic, readonly) NSString *clientInvoiceReference;
@property (nonatomic, readonly) NSString *clientReference;

@end
