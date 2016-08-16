//
//  NSObject+NilIfNull.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "NSObject+NilIfNull.h"

@implementation NSObject (NilIfNull)

- (instancetype)nilIfNull {
    return self == [NSNull null] ? nil : self;
}

@end
