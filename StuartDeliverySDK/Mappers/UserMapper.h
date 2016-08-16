//
//  UserMapper.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 15/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartUser.h"

@interface UserMapper : NSObject

+ (StuartUser *)userWithData:(NSDictionary *)data;

@end
