//
//  StuartClientAccount.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 31/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartClientAccount.h"

@implementation StuartClientAccountBuilder

- (StuartClientAccount *)build {
    return [[StuartClientAccount alloc] initWithBuilder:self];
}

@end

@interface StuartClientAccount ()

@property (nonatomic, copy) NSString *clientAccountID;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *jobTimeExpiration;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;

@end

@implementation StuartClientAccount

- (instancetype)initWithBuilder:(StuartClientAccountBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.clientAccountID = builder.clientAccountID;
        self.type = builder.type;
        self.jobTimeExpiration = builder.jobTimeExpiration;
        self.createdAt = builder.createdAt;
        self.updatedAt = builder.updatedAt;
    }
    return self;
}

+ (instancetype)clientAccountWithBlock:(void (^)(StuartClientAccountBuilder *))builderBlock {
    StuartClientAccountBuilder *builder = [StuartClientAccountBuilder new];
    builderBlock(builder);
    return [builder build];
}

@end
