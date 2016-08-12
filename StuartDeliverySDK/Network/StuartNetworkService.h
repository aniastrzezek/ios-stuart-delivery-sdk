//
//  StuartNetworkService.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

@interface StuartNetworkService : NSObject

- (void)requestWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSData *data, NSError *error))completion;

@end
