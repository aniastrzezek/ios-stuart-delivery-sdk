//
//  StuartAuthorization.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartAuthorization.h"

NSString *const StuartAuthorizationTokenKey = @"StuartAuthorizationToken";
NSString *const StuartAuthorizationRefreshTokenKey = @"StuartRefreshToken";

@implementation StuartAuthorization

+ (instancetype)sharedAuthorization {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] objectForKey:StuartAuthorizationTokenKey];
}

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:StuartAuthorizationTokenKey];
}

- (NSString *)refreshToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:StuartAuthorizationRefreshTokenKey];
}

- (void)setRefreshToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:StuartAuthorizationRefreshTokenKey];
}

- (void)removeToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:StuartAuthorizationTokenKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:StuartAuthorizationRefreshTokenKey];
}

@end
