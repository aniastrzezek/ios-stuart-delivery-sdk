//
//  SignInOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "SignInOperation.h"
#import "SignInRequest.h"
#import "UserMapper.h"
#import "StuartAuthorization.h"

@implementation SignInOperation

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    
    if (self) {
        self.request = [[SignInRequest alloc] initWithUsername:username password:password];
    }
    return self;
}

- (void)start {
    [super start];
    [self.networkService requestWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:^(NSDictionary *json, NSError *error) {
        [StuartAuthorization sharedAuthorization].token = json[StuartTokenKey];
        
        StuartUser *user = [UserMapper userWithData:json];
        self.completion(user, error);
    }];
}


@end
