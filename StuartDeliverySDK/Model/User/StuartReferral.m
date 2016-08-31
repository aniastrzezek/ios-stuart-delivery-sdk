//
//  StuartReferral.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartReferral.h"

@implementation StuartReferralBuilder

- (StuartReferral *)build {
    return [[StuartReferral alloc] initWithBuilder:self];
}

@end


@interface StuartReferral ()

@property (nonatomic, copy) NSString *referralID;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) StuartReferralCode *referralCode;

@end

@implementation StuartReferral

- (instancetype)initWithBuilder:(StuartReferralBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.referralID = builder.referralID;
        self.createdAt = builder.createdAt;
        self.referralCode = builder.referralCode;
    }
    return self;
}

+ (instancetype)referralWithBlock:(void (^)(StuartReferralBuilder *))builderBlock {
    StuartReferralBuilder *builder = [StuartReferralBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
