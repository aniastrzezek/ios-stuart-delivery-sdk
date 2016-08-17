//
//  StuartPlace.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 16/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartAddress.h"

typedef NS_ENUM(NSUInteger, StuartPlaceType) {
    StuartPlaceTypePicking = 2,
    StuartPlaceTypeDelivering = 3
};

@interface StuartPlace : NSObject

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
