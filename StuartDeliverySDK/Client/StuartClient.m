//
//  StuartClient.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartClient.h"

@interface StuartClient ()
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *clientSecret;
@end

@implementation StuartClient

+ (instancetype)defaultClient {
    static id defaultInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        defaultInstance = [[self alloc] init];
    });
    return defaultInstance;
}

- (void)setClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret {
    self.clientID = clientID;
    self.clientSecret = clientSecret;
}

@end
