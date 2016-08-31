//
//  CreateJobRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StuartRequest.h"

extern NSUInteger const StuartMaxPhotoSideLength;

@interface CreateJobRequest : NSObject <StuartRequest>

- (instancetype)initWithJobQuoteID:(NSString *)jobQuoteID;

@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *originComment;
@property (nonatomic, strong) NSString *destinationComment;
@property (nonatomic, strong) NSString *originContactCompany;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) NSString *clientReference;

@end
