//
//  SignInRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

@interface SignInRequest : NSObject <StuartRequest>

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@end
