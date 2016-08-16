//
//  NSError+Stuart.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "NSError+Stuart.h"

NSString *const StuartErrorDomain = @"pl.strzezek.stuart.error";

@implementation NSError (Stuart)

+ (instancetype)stuartErrorWithCode:(StuartErrorCode)code message:(NSString *)message {
    return [self errorWithDomain:StuartErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey: message}];
}

@end
