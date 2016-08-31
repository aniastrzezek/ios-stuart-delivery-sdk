//
//  StuartPlace.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartPlace.h"

@implementation StuartPlaceBuilder

- (StuartPlace *)build {
    return [[StuartPlace alloc] initWithBuilder:self];
}

@end


@interface StuartPlace ()

@property (nonatomic, copy) NSString *placeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) StuartAddress *address;
@property (nonatomic, assign) StuartPlaceType placeType;
@property (nonatomic, copy) NSString *clientReference;
@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *contactFirstname;
@property (nonatomic, copy) NSString *contactLastname;
@property (nonatomic, copy) NSString *contactCompany;
@property (nonatomic, copy) NSString *contactEmail;
@property (nonatomic, copy) NSString *contactPhone;

@end

@implementation StuartPlace

- (instancetype)initWithBuilder:(StuartPlaceBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.placeID = builder.placeID;
        self.name = builder.name;
        self.createdAt = builder.createdAt;
        self.updatedAt = builder.updatedAt;
        self.address = builder.address;
        self.placeType = builder.placeType;
        self.clientReference = builder.clientReference;
        self.comment = builder.comment;
        self.contactFirstname = builder.contactFirstname;
        self.contactLastname = builder.contactLastname;
        self.contactCompany = builder.contactCompany;
        self.contactEmail = builder.contactEmail;
        self.contactPhone = builder.contactPhone;
    }
    return self;
}

+ (instancetype)placeWithBlock:(void (^)(StuartPlaceBuilder *))builderBlock {
    StuartPlaceBuilder *builder = [StuartPlaceBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; name: %@; type: %lu;", self.class, self, self.placeID, self.name, (unsigned long)self.placeType];
    return descriptionString;
}


@end
