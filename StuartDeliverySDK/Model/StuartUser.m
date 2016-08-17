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

@property (nonatomic, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, copy) NSString *lastnameInitial;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *picturePath;
@property (nonatomic, copy) NSString *rating;

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
        self.phone = builder.phone;
        self.picturePath = builder.picturePath;
        self.rating = builder.rating;
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
