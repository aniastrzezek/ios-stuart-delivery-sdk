//
//  SignInOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartOperation.h"
#import "StuartUser.h"

@interface SignInOperation : StuartOperation

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

@property (nonatomic, strong) void (^completion)(StuartUser *, NSError *);

@end
