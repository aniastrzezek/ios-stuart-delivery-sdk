//
//  StuartBillingAccount.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartBillingAccount.h"

@implementation StuartBillingAccountBuilder

- (StuartBillingAccount *)build {
    return [[StuartBillingAccount alloc] initWithBuilder:self];
}

@end


@interface StuartBillingAccount ()

@property (nonatomic, copy) NSString *billingAccountID;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *zipcode;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *vat;

@end

@implementation StuartBillingAccount

- (instancetype)initWithBuilder:(StuartBillingAccountBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.billingAccountID = builder.billingAccountID;
        self.company = builder.company;
        self.address = builder.address;
        self.zipcode = builder.zipcode;
        self.city = builder.city;
        self.country = builder.country;
        self.vat = builder.vat;
    }
    return self;
}

+ (instancetype)billingAccountWithBlock:(void (^)(StuartBillingAccountBuilder *))builderBlock {
    StuartBillingAccountBuilder *builder = [StuartBillingAccountBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; company: %@; vat: %@", self.class, self, self.billingAccountID, self.company, self.vat];
    return descriptionString;
}


@end
