//
//  JobStatusMapper.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobStatusMapper.h"
#import "NSObject+NilIfNull.h"
#import "StuartNetworkService.h"
#import "UserMapper.h"
#import "PlaceMapper.h"
#import "StuartStatus.h"
#import "StuartDriverDeviceLocation.h"

@implementation JobStatusMapper

+ (StuartJobStatus *)jobStatusWithData:(NSDictionary *)data {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

    NSDictionary *clientData = data[StuartClientKey];
    NSDictionary *destinationPlaceData = data[StuartDestinationPlaceKey];
    NSDictionary *originPlaceData = data[StuartOriginPlaceKey];
    NSDictionary *lastStatusData = data[StuartLastStatusKey];
    NSDictionary *currentDeliveryData = data[StuartLastStatusKey];
    NSDictionary *finalJobPriceData = data[StuartFinalJobPriceKey];

    StuartUser *client = [UserMapper userWithData:clientData];
    StuartPlace *destinationPlace = [PlaceMapper placeWithData:destinationPlaceData];
    StuartPlace *originPlace = [PlaceMapper placeWithData:originPlaceData];
    
    StuartStatus *lastStatus = [StuartStatus deliveryStatusWithBlock:^(StuartStatusBuilder *builder) {
        [self configureJobStatusBuilder:builder withData:lastStatusData];
    }];
    
    StuartDelivery *currentDelivery = [StuartDelivery deliveryWithBlock:^(StuartDeliveryBuilder *builder) {
        [self configureDeliveryBuilder:builder withData:currentDeliveryData];
    }];

    StuartJobPrice *finalJobPrice = [StuartJobPrice jobPriceWithBlock:^(StuartJobPriceBuilder *builder) {
        [self configureJobPriceBuilder:builder withData:finalJobPriceData];
    }];
    
    StuartJobStatus *jobStatus = [StuartJobStatus jobStatusWithBlock:^(StuartJobStatusBuilder *builder) {
        builder.client = client;
        builder.clientDesiredArrivalTime = [data[StuartClientDesiredArrivalTimeKey] nilIfNull];
        builder.clientInvoiceReference = [data[StuartClientInvoiceReferenceKey] nilIfNull];
        builder.clientReference = [data[StuartClientReferenceKey] nilIfNull];
        builder.comment = [data[StuartCommentKey] nilIfNull];
        builder.destinationComment = [data[StuartDestinationCommentKey] nilIfNull];
        builder.destinationPlace = destinationPlace;
        builder.expirationInterval = [data[StuartExpirationIntervalKey] integerValue];
        builder.jobStatusID = [data[StuartIDKey] nilIfNull];
        builder.invitationsCount = [data[StuartInvitationsCountKey] integerValue];
        builder.jobCancellation = [data[StuartJobCancellationKey] nilIfNull];
        builder.mandatory = [data[StuartMandatoryKey] boolValue];
        builder.originComment = [data[StuartOriginCommentKey] nilIfNull];
        builder.originPlace = originPlace;
        builder.picturePath = [data[StuartPicturePathKey] nilIfNull];
        builder.renewable = [data[StuartRenewableKey] boolValue];
        builder.trackingUrl = [data[StuartTrackingUrlKey] nilIfNull];
        builder.status = [data[StuartStatusKey] nilIfNull];
        builder.lastStatus = lastStatus;
        builder.currentDelivery = currentDelivery;
        builder.transportType = [[data[StuartTransportTypeKey] nilIfNull][StuartIDKey] integerValue];
        builder.finalJobPrice = finalJobPrice;
        
        builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
        builder.expiresAt = [dateFormatter dateFromString:[data[StuartExpiresAtKey] nilIfNull]];
        builder.lastInvitationSentAt = [dateFormatter dateFromString:[data[StuartLastInvitationSentAtKey] nilIfNull]];
        builder.startInvitingAt = [dateFormatter dateFromString:[data[StuartStartInvitingAtKey] nilIfNull]];
        builder.updatedAt = [dateFormatter dateFromString:[data[StuartUpdatedAtKey] nilIfNull]];
    }];
    
    return jobStatus;
}


#pragma mark - Helpers

+ (void)configureJobStatusBuilder:(StuartStatusBuilder *)builder withData:(NSDictionary *)data {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

    builder.statusID = [data[StuartIDKey] nilIfNull];
    builder.status = [data[StuartStatusKey] nilIfNull];
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.statusType = [data[StuartJobStatusTypeKey][StuartIDKey] integerValue];
}

+ (void)configureDeliveryBuilder:(StuartDeliveryBuilder *)builder withData:(NSDictionary *)data {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSDictionary *lastDeliveryStatusData = data[StuartLastDeliveryStatusKey];
    NSDictionary *deliveryStatusDeliveredData = data[StuartDeliveryStatusDeliveredKey];
    NSDictionary *deliveryStatusPickedData = data[StuartDeliveryStatusPickedKey];
    NSDictionary *currencyData = data[StuartCurrencyKey];
    NSDictionary *driverData = data[StuartDriverKey];
    
    StuartStatus *lastDeliveryStatus = [StuartStatus deliveryStatusWithBlock:^(StuartStatusBuilder *statusBuilder) {
        [self configureDeliveryStatusBuilder:statusBuilder withData:lastDeliveryStatusData];
    }];
    
    StuartStatus *deliveryStatusDelivered = [StuartStatus deliveryStatusWithBlock:^(StuartStatusBuilder *statusBuilder) {
        [self configureDeliveryStatusBuilder:statusBuilder withData:deliveryStatusDeliveredData];
    }];
    
    StuartStatus *deliveryStatusPicked = [StuartStatus deliveryStatusWithBlock:^(StuartStatusBuilder *statusBuilder) {
        [self configureDeliveryStatusBuilder:statusBuilder withData:deliveryStatusPickedData];
    }];
    
    StuartCurrency *currency = [StuartCurrency currencyWithBlock:^(StuartCurrencyBuilder *currencyBuilder) {
        [self configureCurrencyBuilder:currencyBuilder withData:currencyData];
    }];

    StuartDriver *driver = [StuartDriver driverWithBlock:^(StuartDriverBuilder *driverBuilder) {
        [self configureDriverBuilder:driverBuilder withData:driverData];
    }];
    
    builder.lastDeliveryStatus = lastDeliveryStatus;
    builder.deliveryStatusDelivered = deliveryStatusDelivered;
    builder.deliveryStatusPicked = deliveryStatusPicked;
    builder.currency = currency;
    builder.driver = driver;

    builder.deliveryID = [data[StuartIDKey] nilIfNull];
    builder.status = [data[StuartStatusKey] nilIfNull];
    builder.estimatedDistanceToDestination = [data[StuartEstimatedDistanceToDestinationKey] nilIfNull];
    builder.estimatedDistanceToOrigin = [data[StuartEstimatedDistanceToOriginKey] nilIfNull];
    builder.transportType = [[data[StuartTransportTypeKey] nilIfNull][StuartIDKey] integerValue];
    builder.traveledToOriginDistance = [data[StuartTraveledToOriginDistanceKey] nilIfNull];
    builder.suggestedPolylineToDestination = [data[StuartSuggestedPolylineToDestinationKey] nilIfNull];
    builder.suggestedPolylineToOrigin = [data[StuartSuggestedPolylineToOriginKey] nilIfNull];
    builder.destinationSignature = [data[StuartDestinationSignatureKey] nilIfNull];
    builder.originSignature = [data[StuartOriginSignatureKey] nilIfNull];
    builder.currentDriverAmount = [data[StuartCurrentDriverAmountKey] integerValue];
    builder.finalCompanyAmount = [data[StuartFinalCompanyAmountKey] nilIfNull];
    builder.finalDriverAmount = [data[StuartFinalDriverAmountKey] nilIfNull];
    
    builder.etaToDestination = [dateFormatter dateFromString:[data[StuartEtaToDestinationKey] nilIfNull]];
    builder.etaToOrigin = [dateFormatter dateFromString:[data[StuartEtaToOriginKey] nilIfNull]];
    builder.originalEtaToDestination = [dateFormatter dateFromString:[data[StuartOriginalEtaToDestinationKey] nilIfNull]];
    builder.originalEtaToOrigin = [dateFormatter dateFromString:[data[StuartOriginalEtaToOriginKey] nilIfNull]];
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.updatedAt = [dateFormatter dateFromString:[data[StuartUpdatedAtKey] nilIfNull]];

}

+ (void)configureDeliveryStatusBuilder:(StuartStatusBuilder *)builder withData:(NSDictionary *)data {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    builder.statusID = [data[StuartIDKey] nilIfNull];
    builder.status = [data[StuartStatusKey] nilIfNull];
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.statusType = [data[StuartDeliveryStatusTypeKey][StuartIDKey] integerValue];

    NSDictionary *driverDeviceLocationData = data[StuartDriverDeviceLocationTypeKey];
    StuartDriverDeviceLocation *driverDeviceLocation = [StuartDriverDeviceLocation driverDeviceLocationWithBlock:^(StuartDriverDeviceLocationBuilder *locationBuilder) {
        [self configureDriverDeviceLocationBuilder:locationBuilder withData:driverDeviceLocationData];
    }];
    builder.driverDeviceLocation = driverDeviceLocation;
}

+ (void)configureCurrencyBuilder:(StuartCurrencyBuilder *)builder withData:(NSDictionary *)data {
    builder.isoCode = [data[StuartIsoCodeKey] nilIfNull];
    builder.name = [data[StuartNameKey] nilIfNull];
    builder.rate = [data[StuartRateKey] nilIfNull];
    builder.symbol = [data[StuartSymbolKey] nilIfNull];
}

+ (void)configureDriverBuilder:(StuartDriverBuilder *)builder withData:(NSDictionary *)data {
    builder.firstname = data[StuartFirstnameKey];
    builder.phone = data[StuartPhoneKey];
    
    NSDictionary *driverDeviceLocationData = data[StuartDriverDeviceLocationTypeKey];
    StuartDriverDeviceLocation *driverDeviceLocation = [StuartDriverDeviceLocation driverDeviceLocationWithBlock:^(StuartDriverDeviceLocationBuilder *locationBuilder) {
        [self configureDriverDeviceLocationBuilder:locationBuilder withData:driverDeviceLocationData];
    }];
    builder.location = driverDeviceLocation;
}

+ (void)configureDriverDeviceLocationBuilder:(StuartDriverDeviceLocationBuilder *)builder withData:(NSDictionary *)data {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.type = [data[StuartIDKey] integerValue];
    
    float latitude = [[data[StuartLatitudeKey] nilIfNull] floatValue];
    float longitude = [[data[StuartLongitudeKey] nilIfNull] floatValue];
    if (latitude && longitude) {
        builder.location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    }
}

+ (void)configureJobPriceBuilder:(StuartJobPriceBuilder *)builder withData:(NSDictionary *)data {
    builder.jobPriceID = [data[StuartIDKey] nilIfNull];
    builder.basePrice = [data[StuartBasePriceKey] nilIfNull];
    builder.cancellationPrice = [data[StuartCancellationPriceKey] nilIfNull];
    builder.finalTotalAmount = [data[StuartFinalTotalAmountKey] nilIfNull];
    builder.minPrice = [data[StuartMinPriceKey] nilIfNull];
    builder.originalTotalAmount = [data[StuartOriginalTotalAmountKey] nilIfNull];

    StuartJobQuote *job = [StuartJobQuote jobWithBlock:^(StuartJobQuoteBuilder *jobQuoteBuilder) {
        [self configureJobBuilder:jobQuoteBuilder withData:data[StuartJobQuoteKey]];
    }];
    builder.jobQuote = job;
}

+ (void)configureJobBuilder:(StuartJobQuoteBuilder *)builder withData:(NSDictionary *)jobData {
    builder.originPlace = [PlaceMapper placeWithData:jobData[StuartOriginPlaceKey]];
    builder.destinationPlace = [PlaceMapper placeWithData:jobData[StuartDestinationPlaceKey]];
    
    builder.jobQuoteID = [jobData[StuartIDKey] nilIfNull];
    builder.distance = [jobData[StuartDistanceKey] nilIfNull];
    builder.duration = [jobData[StuartDurationKey] nilIfNull];
    builder.durationWithTraffic = [jobData[StuartDurationWithTrafficKey] nilIfNull];
    builder.availableCouriers = [jobData[StuartAvailableCouriersKey] boolValue];
    builder.pickupEtaOptimistic = [jobData[StuartPickupEtaOptimisticKey] nilIfNull];
    builder.pickupEtaPessimistic = [jobData[StuartPickupEtaPessimisticKey] nilIfNull];
    builder.minPrice = [jobData[StuartMinPriceKey] nilIfNull];
    builder.basePrice = [jobData[StuartBasePriceKey] nilIfNull];
    builder.cancellationPrice = [jobData[StuartCancellationPriceKey] nilIfNull];
    builder.originalTotalAmount = [jobData[StuartOriginalTotalAmountKey] nilIfNull];
    builder.finalTotalAmount = [jobData[StuartFinalTotalAmountKey] nilIfNull];
    builder.polyline = [jobData[StuartPolylineKey] nilIfNull];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    builder.createdAt = [dateFormatter dateFromString:[jobData[StuartCreatedAtKey] nilIfNull]];
    builder.expireAt = [dateFormatter dateFromString:[jobData[StuartExpireAtKey] nilIfNull]];
}

@end

