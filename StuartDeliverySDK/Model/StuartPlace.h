//
//  StuartPlace.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, StuartPlaceType) {
    StuartPlaceTypePicking = 2,
    StuartPlaceTypeDelivering = 3
};

@interface StuartPlace : NSObject

@end
