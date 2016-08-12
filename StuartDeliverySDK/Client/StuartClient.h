//
//  StuartClient.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuartClient : NSObject

+ (instancetype)defaultClient;

@property (nonatomic, readonly) NSString *clientID;
@property (nonatomic, readonly) NSString *clientSecret;

- (void)setClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;

@end
