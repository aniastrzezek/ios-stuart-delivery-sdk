//
//  StuartPlace.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartAddress.h"
@class StuartPlace;

typedef NS_ENUM(NSUInteger, StuartPlaceType) {
    StuartPlaceTypePicking = 2,
    StuartPlaceTypeDelivering = 3
};

@interface StuartPlaceBuilder : NSObject

@property (nonatomic, copy) NSString *placeID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) StuartAddress *address;
@property (nonatomic, assign) StuartPlaceType placeType;
@property (nonatomic, copy) NSString *clientReference;
@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *contactFirstname;
@property (nonatomic, copy) NSString *contactLastname;
@property (nonatomic, copy) NSString *contactCompany;
@property (nonatomic, copy) NSString *contactEmail;
@property (nonatomic, copy) NSString *contactPhone;

- (StuartPlace *)build;

@end


@interface StuartPlace : NSObject

- (instancetype)initWithBuilder:(StuartPlaceBuilder *)builder;

+ (instancetype)placeWithBlock:(void (^)(StuartPlaceBuilder *))builderBlock;

@property (nonatomic, readonly) NSString *placeID;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *createdAt;
@property (nonatomic, readonly) NSString *updatedAt;
@property (nonatomic, readonly) StuartAddress *address;
@property (nonatomic, readonly) StuartPlaceType placeType;
@property (nonatomic, readonly) NSString *clientReference;
@property (nonatomic, readonly) NSString *comment;

@property (nonatomic, readonly) NSString *contactFirstname;
@property (nonatomic, readonly) NSString *contactLastname;
@property (nonatomic, readonly) NSString *contactCompany;
@property (nonatomic, readonly) NSString *contactEmail;
@property (nonatomic, readonly) NSString *contactPhone;

@end
