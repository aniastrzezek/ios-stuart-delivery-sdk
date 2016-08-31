//
//  StuartReferral.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartReferralCode.h"
@class StuartReferral;

@interface StuartReferralBuilder : NSObject

@property (nonatomic, copy) NSString *referralID;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) StuartReferralCode *referralCode;

- (StuartReferral *)build;

@end

@interface StuartReferral : NSObject

- (instancetype)initWithBuilder:(StuartReferralBuilder *)builder;

+ (instancetype)referralWithBlock:(void (^)(StuartReferralBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *referralID;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) StuartReferralCode *referralCode;

@end
