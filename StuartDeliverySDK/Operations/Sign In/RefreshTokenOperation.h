//
//  RefreshTokenOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 01/09/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartOperation.h"

@interface RefreshTokenOperation : StuartOperation

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@end
