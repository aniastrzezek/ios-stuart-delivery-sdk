//
//  StuartNetworkService.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

extern NSString *const StuartDateCreatedKey;
extern NSString *const StuartEmailKey;
extern NSString *const StuartFirstnameKey;
extern NSString *const StuartIDKey;
extern NSString *const StuartLastnameKey;
extern NSString *const StuartLastnameInitialKey;
extern NSString *const StuartPhoneKey;
extern NSString *const StuartPicturePathKey;
extern NSString *const StuartRatingKey;
extern NSString *const StuartRefreshTokenKey;
extern NSString *const StuartTokenKey;
extern NSString *const StuartErrorsKey;
extern NSString *const StuartCodeKey;
extern NSString *const StuartKeyKey;
extern NSString *const StuartMessageKey;

@interface StuartNetworkService : NSObject

- (void)requestWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *json, NSError *error))completion;

@end