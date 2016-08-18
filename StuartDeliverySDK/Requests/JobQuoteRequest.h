//
//  JobQuoteRequest.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartRequest.h"

@interface JobQuoteRequest : NSObject <StuartRequest>

- (instancetype)initWithOrigin:(NSString *)origin destination:(NSString *)destination transportTypes:(NSArray *)transportTypes;

@property (nonatomic, strong) NSString *originContactPhone;
@property (nonatomic, strong) NSString *originContactFirstname;
@property (nonatomic, strong) NSString *originContactLastname;
@property (nonatomic, strong) NSString *originContactCompany;
@property (nonatomic, strong) NSString *originContactEmail;

@property (nonatomic, strong) NSString *destinationContactPhone;
@property (nonatomic, strong) NSString *destinationContactFirstname;
@property (nonatomic, strong) NSString *destinationContactLastname;
@property (nonatomic, strong) NSString *destinationContactCompany;
@property (nonatomic, strong) NSString *destinationContactEmail;

@end
