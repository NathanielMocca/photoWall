//
//  RestClient.h
//  photoWall
//
//  Created by Mocca Yang on 2017/5/15.
//  Copyright © 2017年 Appmocca. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RestRequest.h"
#import "RestResponse.h"

@protocol RequestAuthenticator <NSObject>

- (void)authenticate:(RestRequest*)request;

@end

@interface RestClient : NSObject

+ (NSString*)defaultEndPoint;

- (instancetype)initWithAuthenticator:(id<RequestAuthenticator>)authenticator;

- (instancetype)initWithEndPoint:(NSString*)endPoint andAuthenticator:(id<RequestAuthenticator>)authenticator;

- (RestRequest*)path:(NSString*)path;

@end
