//
//  CreateJobRequest.m
//  StuartDeliverySDK
//
//  Created by ania on 19/08/16.
//  Copyright © 2016 Anna Strzeżek. All rights reserved.
//

#import "CreateJobRequest.h"
#import "StuartConfiguration.h"

NSUInteger const StuartMaxPhotoSideLength = 4096;

@interface CreateJobRequest ()

@property (nonatomic, strong) NSString *jobQuoteID;

@end

@implementation CreateJobRequest

- (instancetype)initWithJobQuotID:(NSString *)jobQuoteID {
    self = [super init];
    
    if (self) {
        self.jobQuoteID = jobQuoteID;
    }
    return self;
}

- (NSURL *)url {
    return [StuartConfiguration sharedConfiguration].createJobURL;
}

- (RequestMethod)method {
    return RequestMethodPOST;
}

- (NSDictionary *)parameters {
    NSMutableDictionary *parameters = @{@"jobQuoteId": self.jobQuoteID}.mutableCopy;
    if (self.comment.length) {
        parameters[@"comment"] = self.comment;
    }
    if (self.originComment.length) {
        parameters[@"originComment"] = self.originComment;
    }
    if (self.destinationComment.length) {
        parameters[@"destinationComment"] = self.destinationComment;
    }
    if (self.photo) {
        UIImage *photoToSend = self.photo;
        if ([self photoTooBig]) {
            photoToSend = [self scalePhoto];
        }
        parameters[@"photo"] = [UIImageJPEGRepresentation(photoToSend, 1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    if (self.clientReference.length) {
        parameters[@"clientReference"] = self.clientReference;
    }
    
    return parameters;
}


#pragma mark - Helpers

- (BOOL)photoTooBig {
    return self.photo.size.width > StuartMaxPhotoSideLength || self.photo.size.height > StuartMaxPhotoSideLength;
}

- (UIImage *)scalePhoto {
    CGSize photoSize = self.photo.size;
    CGFloat scale;
    
    if (photoSize.width > photoSize.height) {
        scale = StuartMaxPhotoSideLength / photoSize.width;
    } else {
        scale = StuartMaxPhotoSideLength / photoSize.height;
    }
    
    CGRect scaledRect = CGRectMake(0, 0, photoSize.width * scale, photoSize.height * scale);
    
    UIGraphicsBeginImageContextWithOptions(scaledRect.size, false, 1.0);
    [self.photo drawInRect:scaledRect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}


@end
