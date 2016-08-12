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

@property (nonatomic, readonly) NSURL *signInURL;

@end
