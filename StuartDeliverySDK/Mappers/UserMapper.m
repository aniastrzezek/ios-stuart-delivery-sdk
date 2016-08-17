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
    StuartUser *user = [StuartUser userWithBlock:^(StuartUserBuilder *builder) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

        builder.dateCreated = [dateFormatter dateFromString:[data[StuartCreatedAtKey] nilIfNull]];
        builder.email = [data[StuartEmailKey] nilIfNull];
        builder.firstname = [data[StuartFirstnameKey] nilIfNull];
        builder.userID = [data[StuartIDKey] nilIfNull];
        builder.lastname = [data[StuartLastnameKey] nilIfNull];
        builder.lastnameInitial = [data[StuartLastnameInitialKey] nilIfNull];
        builder.phone = [data[StuartPhoneKey] nilIfNull];
        builder.picturePath = [data[StuartPicturePathKey] nilIfNull];
        builder.rating = [data[StuartRatingKey] nilIfNull];
    }];
    return user;
}

@end
