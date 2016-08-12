//
//  StuartRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RequestMethodPOST,
    RequestMethodGET,
    RequestMethodPUT,
    RequestMethodDELETE
} RequestMethod;

@protocol StuartRequest <NSObject>

@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) RequestMethod method;
@property (nonatomic, readonly) NSDictionary *parameters;
@property (nonatomic, readonly) NSDictionary *headers;

@end
