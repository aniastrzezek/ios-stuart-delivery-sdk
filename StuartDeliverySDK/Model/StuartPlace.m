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

@property (nonatomic, strong) NSString *placeID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) StuartAddress *address;
@property (nonatomic, assign) StuartPlaceType placeType;
@property (nonatomic, strong) NSString *clientReference;
@property (nonatomic, strong) NSString *comment;

@property (nonatomic, strong) NSString *contactFirstname;
@property (nonatomic, strong) NSString *contactLastname;
@property (nonatomic, strong) NSString *contactCompany;
@property (nonatomic, strong) NSString *contactEmail;
@property (nonatomic, strong) NSString *contactPhone;

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
