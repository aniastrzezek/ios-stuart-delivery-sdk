//
//  StuartCurrency.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuartCurrency : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *symbol;
@property (nonatomic, readonly) NSString *isoCode;
@property (nonatomic, readonly) NSInteger rate;

@end
