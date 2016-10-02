//
//  StuartConfiguration.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuartConfiguration : NSObject

+ (instancetype)sharedConfiguration;

@property (nonatomic, assign) BOOL sandbox;

@property (nonatomic, readonly) NSURL *signInURL;
@property (nonatomic, readonly) NSURL *createPlaceURL;
@property (nonatomic, readonly) NSURL *jobQuoteURL;
@property (nonatomic, readonly) NSURL *jobURL;
@property (nonatomic, readonly) NSURL *refreshTokenURL;

@end
