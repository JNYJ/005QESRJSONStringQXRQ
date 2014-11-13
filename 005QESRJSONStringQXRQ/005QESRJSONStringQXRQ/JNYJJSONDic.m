//
//  JNYJJSONDic.m
//  005QESRJSONStringQXRQ
//
//  Created by JNYJ on 14-11-13.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

#import "JNYJJSONDic.h"

@implementation JNYJJSONDic

+(NSString *)dic2JSONString:(NSDictionary *)aDictionay{

	NSError *error;
	NSString *string_json= @"";
	NSData *jsonData = [NSJSONSerialization dataWithJSONObject:aDictionay
													   options:0 // Pass 0 if you don't care about the readability of the generated string
														 error:&error];
	if (! jsonData) {
		NSLog(@"Got an error: %@", error);
	} else {
		string_json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
	}
	return string_json;
}
+(NSDictionary *)parseJSONString:(NSString *)aString{

	NSError *error;

	NSDictionary *dic_JSON =
	[NSJSONSerialization JSONObjectWithData: [aString dataUsingEncoding:NSUTF8StringEncoding]
									options: NSJSONReadingMutableContainers
									  error: &error];
	NSDictionary *dic_return = [NSDictionary dictionaryWithObjectsAndKeys:dic_JSON,@"dic_return_20140424", nil];
	return dic_return;

}
+(NSDictionary *)parseJSONURL:(NSString *)aURL{

	NSURL *URL_ = [NSURL URLWithString:aURL];

	NSData *data_json = [NSData dataWithContentsOfURL:URL_];
	NSError *error;
	NSDictionary *dic_JSON =
	[NSJSONSerialization JSONObjectWithData: data_json
		options: NSJSONReadingMutableContainers
		error: &error];

	NSDictionary *dic_return = [NSDictionary dictionaryWithObjectsAndKeys:dic_JSON,@"dic_return_20140424", nil];
	return dic_return;

}
@end
