//
//  JNYJJSONDic.h
//  005QESRJSONStringQXRQ
//
//  Created by JNYJ on 14-11-13.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNYJJSONDic : NSObject

+(NSString *)dic2JSONString:(NSDictionary *)aDictionay;
+(NSDictionary *)parseJSONString:(NSString *)aString;
+(NSDictionary *)parseJSONURL:(NSString *)aURL;

@end
