//
//  StuartAddress.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "StuartCity.h"

@interface StuartAddress : NSObject

@property (nonatomic, readonly) NSString *addressID;
@property (nonatomic, readonly) NSString *street;
@property (nonatomic, readonly) NSString *postcode;
@property (nonatomic, readonly) StuartCity *city;
@property (nonatomic, readonly) CLLocation *location;
@property (nonatomic, readonly) NSInteger *accuracy;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;

@end
