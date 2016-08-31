//
//  StuartUser.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 15/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartUser.h"


@implementation StuartUserBuilder

- (StuartUser *)build {
    return [[StuartUser alloc] initWithBuilder:self];
}

@end

@interface StuartUser ()

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, copy) NSString *lastnameInitial;
@property (nonatomic, copy) NSString *companyName;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *picturePath;
@property (nonatomic, copy) NSString *picturePathDerived;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, strong) StuartBillingAccount *billingAccount;
@property (nonatomic, strong) StuartClientAccount *clientAccount;
@property (nonatomic, strong) StuartReferralCode *referral;
@property (nonatomic, copy) NSArray <StuartReferral *> *referrals;
@property (nonatomic, strong) NSDate *dateCreated;

@end

@implementation StuartUser

- (instancetype)initWithBuilder:(StuartUserBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.dateCreated = builder.dateCreated;
        self.email = builder.email;
        self.firstname = builder.firstname;
        self.userID = builder.userID;
        self.lastname = builder.lastname;
        self.lastnameInitial = builder.lastnameInitial;
        self.companyName = builder.companyName;
        self.phone = builder.phone;
        self.picturePath = builder.picturePath;
        self.picturePathDerived = builder.picturePathDerived;
        self.rating = builder.rating;
        self.billingAccount = builder.billingAccount;
        self.clientAccount = builder.clientAccount;
        self.referral = builder.referral;
        self.referrals = builder.referrals;
    }
    return self;
}

+ (instancetype)userWithBlock:(void (^)(StuartUserBuilder *))builderBlock {
    StuartUserBuilder *builder = [StuartUserBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; firstname: %@; lastname: %@;", self.class, self, self.userID, self.firstname, self.lastname];
    return descriptionString;
}


@end
