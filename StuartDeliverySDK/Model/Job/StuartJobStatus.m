//
//  StuartJobStatus.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartJobStatus.h"

@implementation StuartJobStatusBuilder

- (StuartJobStatus *)build {
    return [[StuartJobStatus alloc] initWithBuilder:self];
}

@end

@interface StuartJobStatus ()

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

@end

@implementation StuartJobStatus

- (instancetype)initWithBuilder:(StuartJobStatusBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.jobStatusID = builder.jobStatusID;
        self.client = builder.client;
        self.status = builder.status;
        self.lastStatus = builder.lastStatus;
        self.picturePath = builder.picturePath;
        self.trackingUrl = builder.trackingUrl;
        self.mandatory = builder.mandatory;
        self.renewable = builder.renewable;
        self.createdAt = builder.createdAt;
        self.updatedAt = builder.updatedAt;
        self.expiresAt = builder.expiresAt;
        self.expirationInterval = builder.expirationInterval;
        self.currentDelivery = builder.currentDelivery;
        self.destinationPlace = builder.destinationPlace;
        self.originPlace = builder.originPlace;
        self.transportType = builder.transportType;
        self.finalJobPrice = builder.finalJobPrice;
        self.comment = builder.comment;
        self.destinationComment = builder.destinationComment;
        self.originComment = builder.originComment;
        self.jobCancellation = builder.jobCancellation;
        self.startInvitingAt = builder.startInvitingAt;
        self.lastInvitationSentAt = builder.lastInvitationSentAt;
        self.invitationsCount = builder.invitationsCount;
        self.clientDesiredArrivalTime = builder.clientDesiredArrivalTime;
        self.clientInvoiceReference = builder.clientInvoiceReference;
        self.clientReference = builder.clientReference;
    }
    return self;
}

+ (instancetype)jobStatusWithBlock:(void (^)(StuartJobStatusBuilder *))builderBlock {
    StuartJobStatusBuilder *builder = [StuartJobStatusBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
