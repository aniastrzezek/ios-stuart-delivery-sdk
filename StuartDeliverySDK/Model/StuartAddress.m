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

@property (nonatomic, strong) NSString *addressID;
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *postcode;
@property (nonatomic, strong) StuartCity *city;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, assign) NSInteger *accuracy;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;

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
