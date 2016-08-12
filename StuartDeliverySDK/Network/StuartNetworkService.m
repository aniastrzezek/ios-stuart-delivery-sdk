//
//  StuartNetworkService.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartNetworkService.h"
#import "StuartAuthorization.h"

@implementation StuartNetworkService

- (void)requestWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSData *, NSError *))completion {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    request.allHTTPHeaderFields = self.headers;
    request.HTTPMethod = [self nameForRequestMethod:method];
    
    if (parameters.count) {
        request.HTTPBody = [[self parametersString:parameters] dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion(data, error);
    }];
    
    [task resume];
}


#pragma mark - Helpers

+ (NSDictionary *)namesForRequestMethods {
    static NSDictionary *names;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        names = @{@(RequestMethodPOST): @"POST",
                  @(RequestMethodGET): @"GET"};
    });
    return names;
}

- (NSString *)nameForRequestMethod:(RequestMethod)method {
    return [[self class] namesForRequestMethods][@(method)];
}

- (NSDictionary *)headers {
    NSMutableDictionary *allHeaders = [NSMutableDictionary dictionary];
    allHeaders[@"Content-Type"] = @"application/x-www-form-urlencoded";
    NSString *authorizationToken = [StuartAuthorization sharedAuthorization].token;
    if (authorizationToken.length) {
        allHeaders[@"Authorization"] = [NSString stringWithFormat:@"Bearer %@", authorizationToken];
    }
    
    return allHeaders;
}

- (NSString *)parametersString:(NSDictionary *)parameters {
    NSMutableArray *parametersStrings = [NSMutableArray array];
    
    for (NSString *parameterName in parameters) {
        [parametersStrings addObject:[NSString stringWithFormat:@"%@=%@", parameterName, parameters[parameterName]]];
    }
    return [parametersStrings componentsJoinedByString:@"&"];
}

@end
