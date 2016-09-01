//
//  RefreshTokenRequest.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "RefreshTokenRequest.h"
#import "StuartConfiguration.h"
#import "StuartClient.h"
#import "StuartAuthorization.h"
#import "StuartConfiguration.h"

@interface RefreshTokenRequest ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *grantType;

@end

@implementation RefreshTokenRequest

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    
    if (self) {
        self.username = username;
        self.password = password;
        self.grantType = @"refresh_token";
    }
    return self;
}

- (NSURL *)url {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[StuartConfiguration sharedConfiguration].refreshTokenURL resolvingAgainstBaseURL:YES];
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"client_id" value:[StuartClient defaultClient].clientID],
                            [NSURLQueryItem queryItemWithName:@"client_secret" value:[StuartClient defaultClient].clientSecret],
                            [NSURLQueryItem queryItemWithName:@"grant_type" value:self.grantType],
                            [NSURLQueryItem queryItemWithName:@"refresh_token" value:[StuartAuthorization sharedAuthorization].refreshToken]];
    urlComponents.queryItems = queryItems;
    return urlComponents.URL;
}

- (RequestMethod)method {
    return RequestMethodGET;
}

- (NSDictionary *)parameters {
    return nil;
}


@end
