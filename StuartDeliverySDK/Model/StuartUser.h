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
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, copy) NSString *lastnameInitial;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *picturePath;
@property (nonatomic, copy) NSString *rating;

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
@property (nonatomic, readonly) NSString *rating;

@end