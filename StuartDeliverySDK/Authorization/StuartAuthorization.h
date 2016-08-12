//
//  StuartAuthorization.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuartAuthorization : NSObject

+ (instancetype)sharedAuthorization;

@property (nonatomic, strong) NSString *token;

- (void)removeToken;

@end
