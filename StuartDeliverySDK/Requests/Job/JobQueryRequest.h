//
//  JobQueryRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

@interface JobQueryRequest : NSObject <StuartRequest>

- (instancetype)initWithJobID:(NSString *)jobID;

@end
