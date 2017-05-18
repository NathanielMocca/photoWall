//
//  RestResponse.m
//  photoWall
//
//  Created by Mocca Yang on 2017/5/17.
//  Copyright © 2017年 Appmocca. All rights reserved.
//


#import "RestResponse.h"

#import "RestRequest.h"

@implementation RestResponse{
    id _object;
    RestRequest* _request;
    NSHTTPURLResponse* _rawResponse;
}

#pragma mark - Initializers
- (instancetype)initWithRequest:(RestRequest*)request rawResponse:(NSURLResponse*)response andResponseObject:(id)object {
    if (self = [super init]) {
        _object = object;
        _request = request;
        _rawResponse = (NSHTTPURLResponse*)response;
    }
    return self;
}

#pragma mark - Property Getters
- (BOOL)succeeded {
    return self.statusCode == 200;
}

- (id)result {
    return self.succeeded? [_object objectForKey:@"data"] : nil;
}

- (NSInteger)statusCode {
    return _rawResponse.statusCode;
}

- (NSError*)error {
    id errorJsonObject = [_object objectForKey:@"error"];
    NSInteger errorCode = [[errorJsonObject objectForKey:@"code"] integerValue];
    NSString* message = [errorJsonObject objectForKey:@"message"];
    if (message == nil) {
        message = @"unknown error";
    }
    return [[NSError alloc] initWithDomain:message code:errorCode userInfo:nil];
}

- (NSDictionary*)headers {
    return _rawResponse.allHeaderFields;
}

@end
