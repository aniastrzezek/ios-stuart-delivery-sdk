//
//  JobQueryOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartOperation.h"
#import "StuartJobStatus.h"

@interface JobQueryOperation : StuartOperation

- (instancetype)initWithJobID:(NSString *)jobID;

@property (nonatomic, strong) void (^completion)(StuartJobStatus *, NSError *);

@end
