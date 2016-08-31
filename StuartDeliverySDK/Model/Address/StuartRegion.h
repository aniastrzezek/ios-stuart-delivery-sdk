//
//  StuartRegion.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartCountry.h"
@class StuartRegion;

@interface StuartRegionBuilder : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) StuartCountry *country;

- (StuartRegion *)build;

@end

@interface StuartRegion : NSObject

- (instancetype)initWithBuilder:(StuartRegionBuilder *)builder;

+ (instancetype)regionWithBlock:(void (^)(StuartRegionBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) StuartCountry *country;

@end
