//
//  StuartUser.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 15/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartBillingAccount.h"
#import "StuartClientAccount.h"
#import "StuartReferralCode.h"
#import "StuartReferral.h"
@class StuartUser;

@interface StuartUserBuilder : NSObject 

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

- (StuartUser *)build;

@end

@interface StuartUser : NSObject

- (instancetype)initWithBuilder:(StuartUserBuilder *)builder;

+ (instancetype)userWithBlock:(void (^)(StuartUserBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *userID;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *firstname;
@property (nonatomic, readonly) NSString *lastname;
@property (nonatomic, readonly) NSString *lastnameInitial;
@property (nonatomic, readonly) NSString *companyName;
@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) NSString *picturePath;
@property (nonatomic, readonly) NSString *picturePathDerived;
@property (nonatomic, readonly) NSString *rating;
@property (nonatomic, readonly) StuartBillingAccount *billingAccount;
@property (nonatomic, readonly) StuartClientAccount *clientAccount;
@property (nonatomic, readonly) StuartReferralCode *referral;
@property (nonatomic, readonly) NSArray <StuartReferral *> *referrals;
@property (nonatomic, readonly) NSDate *dateCreated;

@end
