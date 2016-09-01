//
//  PlaceMapper.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "PlaceMapper.h"
#import "StuartNetworkService.h"
#import "NSObject+NilIfNull.h"
#import "StuartAddress.h"

@implementation PlaceMapper

+ (StuartPlace *)placeWithData:(NSDictionary *)data {
    NSDictionary *addressData = data[StuartAddressKey];
    NSDictionary *cityData = addressData[StuartCityKey];
    NSDictionary *regionData = cityData[StuartRegionKey];
    NSDictionary *countryData = regionData[StuartCountryKey];
    NSDictionary *currencyData = countryData[StuartDefaultCurrencyKey];

    StuartCurrency *currency = [StuartCurrency currencyWithBlock:^(StuartCurrencyBuilder *builder) {
        [self configureCurrencyBuilder:builder withData:currencyData];
    }];
    
    StuartCountry *country = [StuartCountry countryWithBlock:^(StuartCountryBuilder *builder) {
        [self configureCountryBuilder:builder withData:countryData];
        builder.defaultCurrency = currency;
    }];
    
    StuartRegion *region = [StuartRegion regionWithBlock:^(StuartRegionBuilder *builder) {
        [self configureRegionBuilder:builder withData:regionData];
        builder.country = country;
    }];
    
    StuartCity *city = [StuartCity cityWithBlock:^(StuartCityBuilder *builder) {
        [self configureCityBuilder:builder withData:cityData];
        builder.region = region;
    }];
    
    StuartAddress *address = [StuartAddress addressWithBlock:^(StuartAddressBuilder *builder) {
        [self configureAddressBuilder:builder withData:addressData];
        builder.city = city;
    }];
    
    StuartPlace *place = [StuartPlace placeWithBlock:^(StuartPlaceBuilder *builder) {
        [self configurePlaceBuilder:builder withData:data];
        builder.address = address;
    }];
    
    return place;
}


#pragma mark - Helpers

+ (void)configureCurrencyBuilder:(StuartCurrencyBuilder *)builder withData:(NSDictionary *)currencyData {
    builder.isoCode = [currencyData[StuartIsoCodeKey] nilIfNull];
    builder.name = [currencyData[StuartNameKey] nilIfNull];
    builder.rate = [currencyData[StuartRateKey] nilIfNull];
    builder.symbol = [currencyData[StuartSymbolKey] nilIfNull];
}

+ (void)configureCountryBuilder:(StuartCountryBuilder *)builder withData:(NSDictionary *)countryData {
    builder.countryID = [countryData[StuartIDKey] nilIfNull];
    builder.iso2Code = [countryData[StuartIso2CodeKey] nilIfNull];
    builder.name = [countryData[StuartNameKey] nilIfNull];
}

+ (void)configureRegionBuilder:(StuartRegionBuilder *)builder withData:(NSDictionary *)regionData {
    builder.name = [regionData[StuartNameKey] nilIfNull];
}

+ (void)configureCityBuilder:(StuartCityBuilder *)builder withData:(NSDictionary *)cityData {
    builder.code = [cityData[StuartCodeKey] nilIfNull];
    builder.cityID = [cityData[StuartIDKey] nilIfNull];
    builder.name = [cityData[StuartNameKey] nilIfNull];
    builder.timezone = [cityData[StuartTimezoneKey] nilIfNull];
    
    float latitude = [[cityData[StuartLatitudeKey] nilIfNull] floatValue];
    float longitude = [[cityData[StuartLongitudeKey] nilIfNull] floatValue];
    if (latitude && longitude) {
        builder.location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    }
}

+ (void)configureAddressBuilder:(StuartAddressBuilder *)builder withData:(NSDictionary *)addressData {
    builder.accuracy = [addressData[StuartAccuracyKey] nilIfNull];
    builder.addressID = [addressData[StuartIDKey] nilIfNull];
    builder.postcode = [addressData[StuartPostcodeKey] nilIfNull];
    builder.street = [addressData[StuartStreetKey] nilIfNull];
    
    float latitude = [[addressData[StuartLatitudeKey] nilIfNull] floatValue];
    float longitude = [[addressData[StuartLongitudeKey] nilIfNull] floatValue];
    if (latitude && longitude) {
        builder.location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    }
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    builder.createdAt = [dateFormatter dateFromString:[addressData[StuartCreatedAtKey] nilIfNull]];
    builder.updatedAt = [dateFormatter dateFromString:[addressData[StuartUpdatedAtKey] nilIfNull]];
}

+ (void)configurePlaceBuilder:(StuartPlaceBuilder *)builder withData:(NSDictionary *)data {
    builder.clientReference = [data[StuartClientReferenceKey] nilIfNull];
    builder.comment = [data[StuartCommentKey] nilIfNull];
    builder.contactCompany = [data[StuartContactCompanyKey] nilIfNull];
    builder.contactEmail = [data[StuartContactEmailKey] nilIfNull];
    builder.contactFirstname = [data[StuartContactFirstnameKey] nilIfNull];
    builder.contactLastname = [data[StuartContactLastnameKey] nilIfNull];
    builder.contactPhone = [data[StuartContactPhoneKey] nilIfNull];
    builder.placeID = [data[StuartIDKey] nilIfNull];
    builder.name = [data[StuartNameKey] nilIfNull];
    builder.placeType = [[data[StuartPlaceTypeKey] nilIfNull][StuartIDKey] integerValue];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.updatedAt = [dateFormatter dateFromString:[data[StuartUpdatedAtKey] nilIfNull]];
}

@end
