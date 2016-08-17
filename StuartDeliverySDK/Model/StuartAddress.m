//
//  StuartAddress.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartAddress.h"

@implementation StuartAddressBuilder

- (StuartAddress *)build {
    return [[StuartAddress alloc] initWithBuilder:self];
}

@end


@interface StuartAddress ()

@property (nonatomic, copy) NSString *addressID;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *postcode;
@property (nonatomic, strong) StuartCity *city;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, copy) NSNumber *accuracy;
@property (nonatomic, copy) NSDate *createdAt;
@property (nonatomic, copy) NSDate *updatedAt;

@end

@implementation StuartAddress

- (instancetype)initWithBuilder:(StuartAddressBuilder *)builder {
    self = [super init];
    
    if (self) {
        self.addressID = builder.addressID;
        self.street = builder.street;
        self.postcode = builder.postcode;
        self.city = builder.city;
        self.location = builder.location;
        self.accuracy = builder.accuracy;
        self.createdAt = builder.createdAt;
        self.updatedAt = builder.updatedAt;
    }
    return self;
}

+ (instancetype)addressWithBlock:(void (^)(StuartAddressBuilder *))builderBlock {
    StuartAddressBuilder *builder = [StuartAddressBuilder new];
    builderBlock(builder);
    return [builder build];
}


#pragma mark - Helpers

- (NSString *)description {
    NSString *descriptionString = [NSString stringWithFormat:@"<%@: %p> id: %@; accuracy: %ld; street: %@; postcode: %@; city: %@;", self.class, self, self.addressID, (long)self.accuracy, self.street, self.postcode, self.city];
    return descriptionString;
}


@end
