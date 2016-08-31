//
//  JobStatusMapper.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobStatusMapper.h"
#import "StuartNetworkService.h"

@implementation JobStatusMapper

+ (StuartJobStatus *)jobStatusWithData:(NSDictionary *)data {
    NSDictionary *clientData = data[StuartAddressKey];

    return [StuartJobStatus new];
}

@end
