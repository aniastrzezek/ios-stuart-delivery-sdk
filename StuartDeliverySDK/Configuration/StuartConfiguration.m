//
//  StuartConfiguration.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartConfiguration.h"

@implementation StuartConfiguration

+ (instancetype)sharedConfiguration {
    static id sharedConfiguration;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedConfiguration = [[self alloc] init];
    });
    return sharedConfiguration;
}


#pragma mark - URLs

- (NSURL *)signInURL {
    return [NSURL URLWithString:@"/v1/clients/login" relativeToURL:self.baseURL];
}

- (NSURL *)createPlaceURL {
    return [NSURL URLWithString:@"/v1/places" relativeToURL:self.baseURL];    
}

- (NSURL *)baseURL {
    return [NSURL URLWithString:@"https://sandbox-api.stuart.com"];
}

@end
