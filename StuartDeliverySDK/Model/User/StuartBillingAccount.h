//
//  StuartBillingAccount.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StuartBillingAccount;

@interface StuartBillingAccountBuilder : NSObject

@property (nonatomic, copy) NSString *billingAccountID;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *zipcode;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *vat;

- (StuartBillingAccount *)build;

@end

@interface StuartBillingAccount : NSObject

- (instancetype)initWithBuilder:(StuartBillingAccountBuilder *)builder;

+ (instancetype)billingAccountWithBlock:(void (^)(StuartBillingAccountBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *billingAccountID;
@property (nonatomic, readonly) NSString *company;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) NSString *zipcode;
@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic, readonly) NSString *vat;

@end
