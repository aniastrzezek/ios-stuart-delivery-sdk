//
//  StuartOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartOperation.h"
#import "NSError+Stuart.h"

@interface StuartOperation ()
@property (nonatomic, strong) StuartNetworkService *networkService;
@end

@implementation StuartOperation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.networkService = [StuartNetworkService new];
    }
    return self;
}

- (void)startWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *, NSError *))completion {
    [super start];
    [self.networkService requestWithURL:url method:method parameters:parameters completion:^(NSDictionary *json, NSError *error) {
        if (error.code == StuartErrorCodeInvalidGrant) {
            
        } else {
            completion(json, error);
        }
    }];
}

@end
