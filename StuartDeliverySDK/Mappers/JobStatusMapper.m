//
//  JobStatusMapper.m
//  StuartDeliverySDK
//
//  Created by ania on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "JobStatusMapper.h"

@implementation JobStatusMapper

+ (StuartJobStatus *)jobStatusWithData:(NSDictionary *)data {
    
    return [StuartJobStatus new];
}

@end
