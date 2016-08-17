//
//  StuartRegion.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartCountry.h"

@interface StuartRegion : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) StuartCountry *country;

@end
