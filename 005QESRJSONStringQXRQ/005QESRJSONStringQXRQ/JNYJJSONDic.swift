//
//  JNYJJSONDic.swift
//  005QESRJSONStringQXRQ
//
//  Created by JNYJ on 14-11-13.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

import UIKit



let DEF_JSON_String_swfit : NSString = "{\"JSON desc\" : {\"JSON String menu\":\"Type in JSON String.\", \"URL\":\"Type in return JSON String with URL.\"}}"
let DEF_URL_swift : NSString = "https://gdata.youtube.com/feeds/api/videos?q=remedyLIVE&max-results=5&v=2&alt=jsonc&orderby=published"

enum ParseType {
	case JSONString
	case JSONURL
	case None
}

class JNYJJSONDic: NSObject {
	class func parse(aType : ParseType, parseString aString : NSString) -> NSDictionary?{
		switch aType {
		case .JSONString:
			return JNYJJSONDic.parseJSONString(JSONString: aString)
		case .JSONURL:
			return JNYJJSONDic.parseJSONURL(JSONURL: aString)
		default:
			break
		}
		return nil
	}
	class func parseJSONString(JSONString aString : NSString) -> NSDictionary?{

		var error : NSError?
		var dic_JSON : NSDictionary! = NSJSONSerialization.JSONObjectWithData(aString.dataUsingEncoding(NSUTF8StringEncoding)!,
			options: NSJSONReadingOptions.MutableContainers,
			error: &error) as NSDictionary
		if let item = dic_JSON {
			var dic_return : NSDictionary = NSDictionary(object: item, forKey: "dic_return_20141113")
			return dic_return
		}else{
			return nil
		}
	}
	class func parseJSONURL(JSONURL aURL : NSString) -> NSDictionary?{

		var URL_ : NSURL! = NSURL(string: aURL)
		var data_json : NSData! =  NSData(contentsOfURL: URL_)

		var error_ : NSError?

		if let item = data_json {
			var dic_JSON : NSDictionary! = NSJSONSerialization.JSONObjectWithData(data_json,
				options: NSJSONReadingOptions.MutableContainers, error: &error_) as NSDictionary

			if let item = dic_JSON {
				var dic_return : NSDictionary = NSDictionary(object: item, forKey: "dic_return_20141113")
				return dic_return
			}
		}
		return nil
	}
	class func dic2JSONString(dictionary aDictionay : NSDictionary) -> NSString?{

		var error_ : NSError?
		var data_json : NSData! = NSJSONSerialization.dataWithJSONObject(aDictionay,
			options:NSJSONWritingOptions.allZeros, error: &error_)//// Pass NSJSONWritingOptions.allZeros if you don't care about the readability of the generated string
		if let item = data_json {
			var string_json : NSString! = NSString(data: item, encoding: NSUTF8StringEncoding)
			return string_json
		}else{
			return nil
		}
	}
}
