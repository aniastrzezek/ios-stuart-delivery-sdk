//
//  NSError+Stuart.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const StuartErrorDomain;

typedef NS_ENUM(NSUInteger, StuartErrorCode) {
    StuartErrorCodeOutOfRange = 400004,
    StuartErrorCodeAddressNotSpecific = 422001,
    StuartErrorCodeInvalidGrant = 401001
};

@interface NSError (Stuart)

+ (instancetype)stuartErrorWithCode:(StuartErrorCode)code message:(NSString *)message;

@end
