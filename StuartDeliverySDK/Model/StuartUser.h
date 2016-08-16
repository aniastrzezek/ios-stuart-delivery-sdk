//
//  StuartUser.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 15/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StuartUser;

@interface StuartUserBuilder : NSObject 

@property (nonatomic, strong) NSDate *dateCreated;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *lastnameInitial;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *picturePath;
@property (nonatomic, assign) NSUInteger rating;

- (StuartUser *)build;

@end

@interface StuartUser : NSObject

- (instancetype)initWithBuilder:(StuartUserBuilder *)builder;

+ (instancetype)userWithBlock:(void (^)(StuartUserBuilder *))builderBlock;

@property (nonatomic, readonly) NSDate *dateCreated;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *firstname;
@property (nonatomic, readonly) NSString *userID;
@property (nonatomic, readonly) NSString *lastname;
@property (nonatomic, readonly) NSString *lastnameInitial;
@property (nonatomic, readonly) NSString *phone;
@property (nonatomic, readonly) NSString *picturePath;
@property (nonatomic, readonly) NSUInteger rating;

@end