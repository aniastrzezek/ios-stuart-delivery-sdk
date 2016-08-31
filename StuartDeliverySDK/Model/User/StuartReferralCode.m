//
//  StuartReferralCode.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartReferralCode.h"

@implementation StuartReferralCodeBuilder

- (StuartReferralCode *)build {
    return [[StuartReferralCode alloc] initWithBuilder:self];
}

@end

@interface StuartReferralCode ()

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

@end

@implementation StuartReferralCode

- (instancetype)initWithBuilder:(StuartReferralCodeBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.referralCodeId = builder.referralCodeId;
        self.name = builder.name;
        self.code = builder.code;
        self.amount = builder.amount;
        self.currency = builder.currency;
        self.city = builder.city;
        self.enabled = builder.enabled;
        self.createdAt = builder.createdAt;
        self.expiresAt = builder.expiresAt;
        self.seed = builder.seed;
        self.target = builder.target;
    }
    return self;
}

+ (instancetype)referralCodeWithBlock:(void (^)(StuartReferralCodeBuilder *))builderBlock {
    StuartReferralCodeBuilder *builder = [StuartReferralCodeBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
