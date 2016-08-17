//
//  StuartCity.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "StuartRegion.h"

@interface StuartCity : NSObject

@property (nonatomic, readonly) NSString *cityID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) StuartRegion *region;
@property (nonatomic, readonly) NSString *timezone;
@property (nonatomic, readonly) CLLocation *location;

@end
