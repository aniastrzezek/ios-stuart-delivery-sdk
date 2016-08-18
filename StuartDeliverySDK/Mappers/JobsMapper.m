//
//  JobsMapper.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobsMapper.h"
#import "StuartNetworkService.h"
#import "StuartJob.h"
#import "NSObject+NilIfNull.h"
#import "PlaceMapper.h"

@implementation JobsMapper

+ (NSArray *)jobsWithData:(NSDictionary *)data {
    NSMutableArray *jobs = [NSMutableArray array];
    
    for (NSNumber *transportType in data) {
        NSDictionary *jobData = data[transportType];
        if ([jobData[StuartErrorsKey] count]) {
            continue;
        }
        
        NSDictionary *currencyData = jobData[StuartCurrencyKey];
        
        StuartCurrency *currency = [StuartCurrency currencyWithBlock:^(StuartCurrencyBuilder *builder) {
            [self configureCurrencyBuilder:builder withData:currencyData];
        }];
        
        StuartJob *job = [StuartJob jobWithBlock:^(StuartJobBuilder *builder) {
            builder.transportType = transportType.integerValue;
            builder.currency = currency;

            [self configureJobBuilder:builder withData:jobData];
        }];
        [jobs addObject:job];
    }
    
    NSArray *sortedJobs = [jobs sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        StuartJobTransportType first = ((StuartJob *)obj1).transportType;
        StuartJobTransportType second = ((StuartJob *)obj2).transportType;

        if (first < second) {
            return NSOrderedAscending;
        } else if (first > second) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
    return sortedJobs;
}


#pragma mark - Helpers

+ (void)configureCurrencyBuilder:(StuartCurrencyBuilder *)builder withData:(NSDictionary *)currencyData {
    builder.isoCode = [currencyData[StuartIsoCodeKey] nilIfNull];
    builder.name = [currencyData[StuartNameKey] nilIfNull];
    builder.rate = [currencyData[StuartRateKey] nilIfNull];
    builder.symbol = [currencyData[StuartSymbolKey] nilIfNull];
}

+ (void)configureJobBuilder:(StuartJobBuilder *)builder withData:(NSDictionary *)jobData {
    builder.originPlace = [PlaceMapper placeWithData:jobData[StuartOriginPlaceKey]];
    builder.destinationPlace = [PlaceMapper placeWithData:jobData[StuartDestinationPlaceKey]];
    
    builder.jobID = [jobData[StuartIDKey] nilIfNull];
    builder.distance = [jobData[StuartDistanceKey] nilIfNull];
    builder.duration = [jobData[StuartDurationKey] nilIfNull];
    builder.durationWithTraffic = [jobData[StuartDurationWithTrafficKey] nilIfNull];
    builder.availableCouriers = [jobData[StuartAvailableCouriersKey] integerValue] == 1;
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
