//
//  JobStatusMapper.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartJobStatus.h"

@interface JobStatusMapper : NSObject

+ (StuartJobStatus *)jobStatusWithData:(NSDictionary *)data;

@end
