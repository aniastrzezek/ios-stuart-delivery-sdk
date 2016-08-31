//
//  UserMapper.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 15/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "UserMapper.h"
#import "StuartNetworkService.h"
#import "NSObject+NilIfNull.h"

@implementation UserMapper

+ (StuartUser *)userWithData:(NSDictionary *)data {
    NSDictionary *billingAccountData = data[StuartBillingAccountKey];
    NSDictionary *clientAccountData = data[StuartClientAccountKey];
    NSDictionary *referralData = data[StuartReferralKey];
    NSArray *referralsArray = data[StuartReferralsKey];

    StuartBillingAccount *billingAccount = [StuartBillingAccount billingAccountWithBlock:^(StuartBillingAccountBuilder *builder) {
        [self configureBillingAccountBuilder:builder withData:billingAccountData];
    }];

    StuartClientAccount *clientAccount = [StuartClientAccount clientAccountWithBlock:^(StuartClientAccountBuilder *builder) {
        [self configureClientAccountBuilder:builder withData:clientAccountData];
    }];
    
    StuartReferralCode *referral = [StuartReferralCode referralCodeWithBlock:^(StuartReferralCodeBuilder *builder) {
        [self configureReferralCodeBuilder:builder withData:referralData];
    }];
    
    NSMutableArray *referrals = [NSMutableArray array];
    for (NSDictionary *referralData in referralsArray) {
        StuartReferral *referral = [StuartReferral referralWithBlock:^(StuartReferralBuilder *builder) {
            [self configureReferralBuilder:builder withData:referralData];
        }];
        
        [referrals addObject:referral];
    }

    StuartUser *user = [StuartUser userWithBlock:^(StuartUserBuilder *builder) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
        builder.dateCreated = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
        builder.email = [data[StuartEmailKey] nilIfNull];
        builder.firstname = [data[StuartFirstnameKey] nilIfNull];
        builder.userID = [data[StuartIDKey] nilIfNull];
        builder.lastname = [data[StuartLastnameKey] nilIfNull];
        builder.lastnameInitial = [data[StuartLastnameInitialKey] nilIfNull];
        builder.companyName = [data[StuartCompanyNameKey] nilIfNull];
        builder.phone = [data[StuartPhoneKey] nilIfNull];
        builder.picturePath = [data[StuartPicturePathKey] nilIfNull];
        builder.picturePathDerived = [data[StuartPicturePathDerivedKey] nilIfNull];
        builder.rating = [data[StuartRatingKey] nilIfNull];
        builder.billingAccount = billingAccount;
        builder.clientAccount = clientAccount;
        builder.referral = referral;
        builder.referrals = referrals;
    }];
    return user;
}


#pragma mark - Helpers

+ (void)configureBillingAccountBuilder:(StuartBillingAccountBuilder *)builder withData:(NSDictionary *)data {
    builder.billingAccountID = [data[StuartIDKey] nilIfNull];
    builder.company = [data[StuartCompanyKey] nilIfNull];
    builder.address = [data[StuartAddressKey] nilIfNull];
    builder.zipcode = [data[StuartZipcodeKey] nilIfNull];
    builder.city = [data[StuartCityKey] nilIfNull];
    builder.country = [data[StuartCountryKey] nilIfNull];
    builder.vat = [data[StuartVatKey] nilIfNull];
}

+ (void)configureClientAccountBuilder:(StuartClientAccountBuilder *)builder withData:(NSDictionary *)data {
    builder.clientAccountID = [data[StuartIDKey] nilIfNull];
    builder.type = [data[StuartTypeKey] nilIfNull];
    builder.jobTimeExpiration = [data[StuartJobTimeExpirationKey] nilIfNull];

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.updatedAt = [dateFormatter dateFromString:[data[StuartUpdatedAtKey] nilIfNull]];
}

+ (void)configureReferralCodeBuilder:(StuartReferralCodeBuilder *)builder withData:(NSDictionary *)data {
    builder.referralCodeId = [data[StuartIDKey] nilIfNull];
    builder.name = [data[StuartNameKey] nilIfNull];
    builder.code = [data[StuartCodeKey] nilIfNull];
    builder.amount = [data[StuartAmountKey] nilIfNull];
    builder.currency = [data[StuartCurrencyKey] nilIfNull];
    builder.city = [data[StuartCityKey] nilIfNull];
    builder.enabled = [data[StuartEnabledKey] boolValue];
    builder.seed = [data[StuartSeedKey] nilIfNull];
    builder.target = [data[StuartTargetKey] nilIfNull];

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
    builder.expiresAt = [dateFormatter dateFromString:[data[StuartExpiresAtKey] nilIfNull]];
}

+ (void)configureReferralBuilder:(StuartReferralBuilder *)builder withData:(NSDictionary *)data {
    builder.referralID = [data[StuartIDKey] nilIfNull];
    builder.referralCode = [StuartReferralCode referralCodeWithBlock:^(StuartReferralCodeBuilder *builder) {
        [self configureReferralCodeBuilder:builder withData:data[StuartReferralCodeKey]];
    }];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    builder.createdAt = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
}

@end
