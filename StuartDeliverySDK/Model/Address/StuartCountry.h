//
//  StuartCountry.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartCurrency.h"
@class StuartCountry;

@interface StuartCountryBuilder : NSObject

@property (nonatomic, copy) NSString *countryID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iso2Code;
@property (nonatomic, strong) StuartCurrency *defaultCurrency;

- (StuartCountry *)build;

@end

@interface StuartCountry : NSObject

- (instancetype)initWithBuilder:(StuartCountryBuilder *)builder;

+ (instancetype)countryWithBlock:(void (^)(StuartCountryBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *countryID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *iso2Code;
@property (nonatomic, readonly) StuartCurrency *defaultCurrency;

@end
