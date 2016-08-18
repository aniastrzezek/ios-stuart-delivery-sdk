//
//  StuartNetworkService.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 12/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

extern NSString *const StuartEmailKey;
extern NSString *const StuartFirstnameKey;
extern NSString *const StuartIDKey;
extern NSString *const StuartLastnameKey;
extern NSString *const StuartLastnameInitialKey;
extern NSString *const StuartPhoneKey;
extern NSString *const StuartPicturePathKey;
extern NSString *const StuartRatingKey;
extern NSString *const StuartRefreshTokenKey;
extern NSString *const StuartTokenKey;
extern NSString *const StuartErrorsKey;
extern NSString *const StuartCodeKey;
extern NSString *const StuartKeyKey;
extern NSString *const StuartMessageKey;
extern NSString *const StuartAccuracyKey;
extern NSString *const StuartAddressKey;
extern NSString *const StuartCityKey;
extern NSString *const StuartClientReferenceKey;
extern NSString *const StuartCodeKey;
extern NSString *const StuartCommentKey;
extern NSString *const StuartContactCompanyKey;
extern NSString *const StuartContactEmailKey;
extern NSString *const StuartContactFirstnameKey;
extern NSString *const StuartContactLastnameKey;
extern NSString *const StuartContactPhoneKey;
extern NSString *const StuartCountryKey;
extern NSString *const StuartCreatedAtKey;
extern NSString *const StuartDefaultCurrencyKey;
extern NSString *const StuartIdKey;
extern NSString *const StuartIso2CodeKey;
extern NSString *const StuartIsoCodeKey;
extern NSString *const StuartLatitudeKey;
extern NSString *const StuartLongitudeKey;
extern NSString *const StuartNameKey;
extern NSString *const StuartPlaceTypeKey;
extern NSString *const StuartPostcodeKey;
extern NSString *const StuartRateKey;
extern NSString *const StuartRegionKey;
extern NSString *const StuartStreetKey;
extern NSString *const StuartSymbolKey;
extern NSString *const StuartTimezoneKey;
extern NSString *const StuartUpdatedAtKey;
extern NSString *const StuartAvailableCouriersKey;
extern NSString *const StuartBasePriceKey;
extern NSString *const StuartCancellationPriceKey;
extern NSString *const StuartCreatedAtKey;
extern NSString *const StuartCurrencyKey;
extern NSString *const StuartDestinationPlaceKey;
extern NSString *const StuartDistanceKey;
extern NSString *const StuartDurationKey;
extern NSString *const StuartDurationWithTrafficKey;
extern NSString *const StuartExpireAtKey;
extern NSString *const StuartFinalTotalAmountKey;
extern NSString *const StuartIdKey;
extern NSString *const StuartMinPriceKey;
extern NSString *const StuartOriginalTotalAmountKey;
extern NSString *const StuartOriginPlaceKey;
extern NSString *const StuartPickupEtaOptimisticKey;
extern NSString *const StuartPickupEtaPessimisticKey;
extern NSString *const StuartPolylineKey;

@interface StuartNetworkService : NSObject

- (void)requestWithURL:(NSURL *)url method:(RequestMethod)method parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *json, NSError *error))completion;

@end