//
//  SignInOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "SignInOperation.h"
#import "SignInRequest.h"

@implementation SignInOperation

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    
    if (self) {
        self.request = [[SignInRequest alloc] initWithUsername:username password:password];
    }
    return self;
}

@end
