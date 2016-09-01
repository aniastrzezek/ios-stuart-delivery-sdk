//
//  StuartOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartNetworkService.h"

@interface StuartOperation : NSOperation

@property (nonatomic, readonly) StuartNetworkService *networkService;
@property (nonatomic, strong) id <StuartRequest> request;

- (void)startWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *json, NSError *error))completion;

@end
