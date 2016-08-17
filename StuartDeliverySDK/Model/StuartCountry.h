//
//  StuartCountry.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartCurrency.h"

@interface StuartCountry : NSObject

@property (nonatomic, readonly) NSString *countryID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *iso2Code;
@property (nonatomic, readonly) StuartCurrency *defaultCurrency;

@end
