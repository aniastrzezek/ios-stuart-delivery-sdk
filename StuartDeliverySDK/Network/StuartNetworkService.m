//
//  StuartNetworkService.m
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "StuartNetworkService.h"
#import "StuartAuthorization.h"
#import "NSError+Stuart.h"

NSString *const StuartEmailKey = @"email";
NSString *const StuartFirstnameKey = @"firstname";
NSString *const StuartIDKey = @"id";
NSString *const StuartLastnameKey = @"lastname";
NSString *const StuartLastnameInitialKey = @"lastnameInitial";
NSString *const StuartPhoneKey = @"phone";
NSString *const StuartPicturePathKey = @"picturePath";
NSString *const StuartRatingKey = @"ratingAvg";
NSString *const StuartRefreshTokenKey = @"refreshToken";
NSString *const StuartTokenKey = @"token";
NSString *const StuartErrorsKey = @"errors";
NSString *const StuartKeyKey = @"key";
NSString *const StuartMessageKey = @"message";
NSString *const StuartAccuracyKey = @"accuracy";
NSString *const StuartAddressKey = @"address";
NSString *const StuartCityKey = @"city";
NSString *const StuartClientReferenceKey = @"clientReference";
NSString *const StuartCodeKey = @"code";
NSString *const StuartCommentKey = @"comment";
NSString *const StuartContactCompanyKey = @"contactCompany";
NSString *const StuartContactEmailKey = @"contactEmail";
NSString *const StuartContactFirstnameKey = @"contactFirstname";
NSString *const StuartContactLastnameKey = @"contactLastname";
NSString *const StuartContactPhoneKey = @"contactPhone";
NSString *const StuartCountryKey = @"country";
NSString *const StuartCreatedAtKey = @"createdAt";
NSString *const StuartDefaultCurrencyKey = @"defaultCurrency";
NSString *const StuartIso2CodeKey = @"iso2Code";
NSString *const StuartIsoCodeKey = @"isoCode";
NSString *const StuartLatitudeKey = @"latitude";
NSString *const StuartLongitudeKey = @"longitude";
NSString *const StuartNameKey = @"name";
NSString *const StuartPlaceTypeKey = @"placeType";
NSString *const StuartPostcodeKey = @"postcode";
NSString *const StuartRateKey = @"rate";
NSString *const StuartRegionKey = @"region";
NSString *const StuartStreetKey = @"street";
NSString *const StuartSymbolKey = @"symbol";
NSString *const StuartTimezoneKey = @"timezone";
NSString *const StuartUpdatedAtKey = @"updatedAt";

@implementation StuartNetworkService

- (void)requestWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *, NSError *))completion {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    request.allHTTPHeaderFields = self.headers;
    request.HTTPMethod = [self nameForRequestMethod:method];
    
    if (parameters.count) {
        request.HTTPBody = [[self parametersString:parameters] dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *errors = json[StuartErrorsKey];
        if (errors.count) {
            NSUInteger firstErrorCode = [errors.firstObject[StuartCodeKey] integerValue];
            NSString *firstErrorMessage = errors.firstObject[StuartMessageKey];
            error = [NSError stuartErrorWithCode:firstErrorCode message:firstErrorMessage];
        }
        
        completion(json, error);
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
