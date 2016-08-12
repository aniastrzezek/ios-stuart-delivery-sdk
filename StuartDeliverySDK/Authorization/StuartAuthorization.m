//
//  StuartAuthorization.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartAuthorization.h"

NSString *const StuartAuthorizationTokenKey = @"StuartAuthorizationToken";

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

- (void)removeToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:StuartAuthorizationTokenKey];
}

@end
