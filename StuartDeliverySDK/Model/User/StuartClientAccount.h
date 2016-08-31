//
//  StuartClientAccount.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StuartClientAccount;

@interface StuartClientAccountBuilder : NSObject

@property (nonatomic, copy) NSString *clientAccountID;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *jobTimeExpiration;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;

- (StuartClientAccount *)build;

@end

@interface StuartClientAccount : NSObject

- (instancetype)initWithBuilder:(StuartClientAccountBuilder *)builder;

+ (instancetype)clientAccountWithBlock:(void (^)(StuartClientAccountBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *clientAccountID;
@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) NSString *jobTimeExpiration;
@property (nonatomic, readonly) NSDate *createdAt;
@property (nonatomic, readonly) NSDate *updatedAt;

@end
