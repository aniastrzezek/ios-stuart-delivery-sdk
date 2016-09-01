//
//  RefreshTokenRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

@interface RefreshTokenRequest : NSObject <StuartRequest>

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@end
