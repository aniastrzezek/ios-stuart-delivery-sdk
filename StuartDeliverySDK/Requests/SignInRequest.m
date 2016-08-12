//
//  SignInRequest.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "SignInRequest.h"
#import "StuartConfiguration.h"

@interface SignInRequest ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *grantType;

@end

@implementation SignInRequest

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    
    if (self) {
        self.username = username;
        self.password = password;
        self.grantType = @"password";
    }
    return self;
}

- (NSURL *)url {
    return [StuartConfiguration sharedConfiguration].signInURL;
}

- (RequestMethod)method {
    return RequestMethodPOST;
}

- (NSDictionary *)parameters {
    return @{@"username": self.username,
             @"password": self.password,
             @"grant_type": self.grantType};
}

- (NSDictionary *)headers {
    return @{@"Content-Type": @"application/x-www-form-urlencoded"};
}

@end
