//
//  StuartReferralCode.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StuartReferralCode;

@interface StuartReferralCodeBuilder : NSObject

@property (nonatomic, copy) NSString *referralCodeId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *expiresAt;
@property (nonatomic, copy) NSString *seed;
@property (nonatomic, copy) NSString *target;

- (StuartReferralCode *)build;

@end

@interface StuartReferralCode : NSObject

- (instancetype)initWithBuilder:(StuartReferralCodeBuilder *)builder;

+ (instancetype)referralCodeWithBlock:(void (^)(StuartReferralCodeBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *referralCodeId;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) NSString *amount;
@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly) BOOL enabled;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *expiresAt;
@property (nonatomic, readonly) NSString *seed;
@property (nonatomic, readonly) NSString *target;

@end
