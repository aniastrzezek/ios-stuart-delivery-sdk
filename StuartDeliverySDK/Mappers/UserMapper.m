//
//  UserMapper.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 15/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "UserMapper.h"
#import "StuartNetworkService.h"

@implementation UserMapper

+ (StuartUser *)userWithData:(NSDictionary *)data {
    StuartUser *user = [StuartUser userWithBlock:^(StuartUserBuilder *builder) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

        builder.dateCreated = [dateFormatter dateFromString:data[StuartDateCreatedKey]];
        builder.email = data[StuartEmailKey];
        builder.firstname = data[StuartFirstnameKey];
        builder.userID = data[StuartIDKey];
        builder.lastname = data[StuartLastnameKey];
        builder.lastnameInitial = data[StuartLastnameInitialKey];
        builder.phone = data[StuartPhoneKey];
        builder.picturePath = data[StuartPicturePathKey];
        builder.rating = [data[StuartRatingKey] integerValue];
    }];
    return user;
}

@end
