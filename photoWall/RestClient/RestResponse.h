//
//  RestResponse.h
//  photoWall
//
//  Created by Mocca Yang on 2017/5/17.
//  Copyright © 2017年 Appmocca. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RestRequest;

@interface RestResponse : NSObject

- (instancetype)initWithRequest:(RestRequest*)request rawResponse:(NSURLResponse*)response andResponseObject:(id)object;

@property (readonly) NSInteger statusCode;
@property (readonly) BOOL succeeded;
@property (readonly) id result;
@property (readonly) NSError* error;
@property (readonly) NSDictionary* headers;

@end
