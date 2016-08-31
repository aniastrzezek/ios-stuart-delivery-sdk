//
//  JobQueryOperation.h
//  StuartDeliverySDK
//
//  Created by ania on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartOperation.h"
#import "StuartJobStatus.h"

@interface JobQueryOperation : StuartOperation

- (instancetype)initWithJobID:(NSString *)jobID;

@property (nonatomic, strong) void (^completion)(StuartJobStatus *, NSError *);

@end
