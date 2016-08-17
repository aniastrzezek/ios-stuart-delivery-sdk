//
//  StuartCurrency.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StuartCurrency;

@interface StuartCurrencyBuilder : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, copy) NSString *isoCode;
@property (nonatomic, strong) NSNumber *rate;

- (StuartCurrency *)build;

@end

@interface StuartCurrency : NSObject

- (instancetype)initWithBuilder:(StuartCurrencyBuilder *)builder;

+ (instancetype)currencyWithBlock:(void (^)(StuartCurrencyBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *symbol;
@property (nonatomic, readonly) NSString *isoCode;
@property (nonatomic, readonly) NSNumber *rate;

@end
