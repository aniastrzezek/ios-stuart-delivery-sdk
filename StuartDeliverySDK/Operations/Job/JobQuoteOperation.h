//
//  JobQuoteOperation.h
//  StuartDeliverySDK
//
//  Created by Anna Strzezek on 17/08/2016.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuartOperation.h"

@interface JobQuoteOperation : StuartOperation

- (instancetype)initWithOrigin:(NSString *)origin destination:(NSString *)destination transportTypes:(NSArray *)transportTypes;

- (void)setOriginContactPhone:(NSString *)originContactPhone;
- (void)setOriginContactFirstname:(NSString *)originContactFirstname;
- (void)setOriginContactLastname:(NSString *)originContactLastname;
- (void)setOriginContactCompany:(NSString *)originContactCompany;
- (void)setOriginContactEmail:(NSString *)originContactEmail;
- (void)setDestinationContactPhone:(NSString *)destinationContactPhone;
- (void)setDestinationContactFirstname:(NSString *)destinationContactFirstname;
- (void)setDestinationContactLastname:(NSString *)destinationContactLastname;
- (void)setDestinationContactCompany:(NSString *)destinationContactCompany;
- (void)setDestinationContactEmail:(NSString *)destinationContactEmail;

@property (nonatomic, strong) void (^completion)(NSArray *, NSError *);

@end
