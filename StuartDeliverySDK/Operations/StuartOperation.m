//
//  StuartOperation.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartOperation.h"

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

- (void)startWithCompletion:(void (^)(NSData *, NSError *))completion {
    [super start];
    [self.networkService requestWithURL:self.request.url method:self.request.method parameters:self.request.parameters completion:completion];
}

@end
