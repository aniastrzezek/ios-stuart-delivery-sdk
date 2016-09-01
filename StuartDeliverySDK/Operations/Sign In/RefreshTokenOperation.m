//
//  RefreshTokenOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "RefreshTokenOperation.h"
#import "RefreshTokenRequest.h"
#import "StuartAuthorization.h"

@implementation RefreshTokenOperation

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    
    if (self) {
        self.request = [[RefreshTokenRequest alloc] initWithUsername:username password:password];
    }
    return self;
}

- (void)start {
    [super start];
    [self.networkService requestWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:^(NSDictionary *json, NSError *error) {
        [StuartAuthorization sharedAuthorization].token = json[StuartTokenKey];
        [StuartAuthorization sharedAuthorization].refreshToken = json[StuartRefreshTokenKey];
    }];
}

@end
