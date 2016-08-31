//
//  StuartDelivery.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartCurrency.h"
#import "StuartDeliveryStatus.h"

@interface StuartDelivery : NSObject

@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) StuartCurrency *currency;
@property (nonatomic, readonly) NSInteger currentDriverAmount;
@property (nonatomic, readonly) StuartDeliveryStatus *deliveryStatusDelivered;
@property (nonatomic, readonly) StuartDeliveryStatus *deliveryStatusPicked;
@property (nonatomic, readonly) NSString *destinationSignature;

@end
