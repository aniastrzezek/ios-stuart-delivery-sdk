//
//  StuartJobType.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 30/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, StuartJobTypeCode) {
    StuartJobTypeCodeTransportStandard = 1
};

@interface StuartJobType : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) StuartJobTypeCode code;

@end
