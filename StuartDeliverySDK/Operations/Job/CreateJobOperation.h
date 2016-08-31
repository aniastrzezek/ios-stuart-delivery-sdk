//
//  CreateJobOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StuartOperation.h"
#import "StuartJobStatus.h"

@interface CreateJobOperation : StuartOperation

- (instancetype)initWithJobQuoteID:(NSString *)jobQuoteID;

- (void)setComment:(NSString *)comment;
- (void)setOriginComment:(NSString *)originComment;
- (void)setDestinationComment:(NSString *)destinationComment;
- (void)setPhoto:(UIImage *)photo;
- (void)setClientReference:(NSString *)clientReference;

@property (nonatomic, strong) void (^completion)(StuartJobStatus *, NSError *);

@end
