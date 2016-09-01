//
//  StuartJobPrice.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartJobQuote.h"
@class StuartJobPrice;

@interface StuartJobPriceBuilder : NSObject

@property (nonatomic, copy) NSString *jobPriceID;
@property (nonatomic, strong) StuartJobQuote *jobQuote;
@property (nonatomic, strong) NSNumber *basePrice;
@property (nonatomic, strong) NSNumber *cancellationPrice;
@property (nonatomic, strong) NSNumber *finalTotalAmount;
@property (nonatomic, strong) NSNumber *minPrice;
@property (nonatomic, strong) NSNumber *originalTotalAmount;

- (StuartJobPrice *)build;

@end

@interface StuartJobPrice : NSObject

- (instancetype)initWithBuilder:(StuartJobPriceBuilder *)builder;

+ (instancetype)jobPriceWithBlock:(void (^)(StuartJobPriceBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *jobPriceID;
@property (nonatomic, readonly) StuartJobQuote *jobQuote;
@property (nonatomic, readonly) NSNumber *basePrice;
@property (nonatomic, readonly) NSNumber *cancellationPrice;
@property (nonatomic, readonly) NSNumber *finalTotalAmount;
@property (nonatomic, readonly) NSNumber *minPrice;
@property (nonatomic, readonly) NSNumber *originalTotalAmount;

@end
