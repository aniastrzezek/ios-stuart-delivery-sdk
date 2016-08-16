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


@end
