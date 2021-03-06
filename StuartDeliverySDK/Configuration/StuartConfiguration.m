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

- (NSURL *)jobQuoteURL {
    return [NSURL URLWithString:@"v1/jobs/quotes/types" relativeToURL:self.baseURL];
}

- (NSURL *)jobURL {
    return [NSURL URLWithString:@"v1/jobs" relativeToURL:self.baseURL];
}

- (NSURL *)refreshTokenURL {
    return [NSURL URLWithString:@"oauth/v2/token" relativeToURL:self.baseURL];
}

- (NSURL *)baseURL {
    return self.sandbox ? self.sandboxBaseURL : self.productionBaseURL;
}

- (NSURL *)sandboxBaseURL {
    return [NSURL URLWithString:@"https://sandbox-api.stuart.com"];
}

- (NSURL *)productionBaseURL {
    return [NSURL URLWithString:@"https://api.stuart.com"];
}


@end
