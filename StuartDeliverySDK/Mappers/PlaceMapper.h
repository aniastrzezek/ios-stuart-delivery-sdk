//
//  PlaceMapper.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartPlace.h"

@interface PlaceMapper : NSObject

+ (StuartPlace *)placeWithData:(NSDictionary *)data;

@end
