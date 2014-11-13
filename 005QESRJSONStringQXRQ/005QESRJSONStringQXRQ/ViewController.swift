//
//  ViewController.swift
//  005QESRJSONStringQXRQ
//
//  Created by JNYJ on 14-11-13.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

	@IBOutlet var switchControl : UISegmentedControl!
	@IBOutlet var textView : UITextView!
	@IBOutlet var button_parse : UIButton!
	var isParsed : Bool!
	var string_current :NSString!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.switchControl.selectedSegmentIndex = 0
		self.textView.text = DEF_JSON_String_swfit
		self.isParsed = false
		self.string_current =  self.textView.text
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	//MARK: Delegate
	func textViewDidEndEditing(textView: UITextView) {
		textView.resignFirstResponder()
	}
	//MARK: IBAction
	@IBAction func event_switchControl(aSwitchControl : UISegmentedControl){
		self.isParsed = false
		self.button_parse.setTitle("Parse", forState: UIControlState.Normal)
		if aSwitchControl.selectedSegmentIndex == 0 {
			self.textView.text = DEF_JSON_String_swfit
		}else{
			self.textView.text = DEF_URL_swift
		}
	}
	@IBAction func event_parse(){
		if let item = self.isParsed {
			if item {
				self.isParsed = false
				self.button_parse.setTitle("Parse", forState: UIControlState.Normal)
				self.textView.text = self.string_current
			}else{
				self.isParsed = true
				self.button_parse.setTitle("Done", forState: UIControlState.Normal)
				self.string_current = self.textView.text
				if self.switchControl.selectedSegmentIndex == 0 {
					var dic_ : NSDictionary! = JNYJJSONDic.parse(ParseType.JSONString, parseString: self.textView.text)
					if let item = dic_{
						var string_dic : NSString! = JNYJJSONDic.dic2JSONString(dictionary: item)
						if let value = string_dic{
							self.textView.text = value
							return
						}
					}
				}else{
					var dic_ : NSDictionary! = JNYJJSONDic.parse(ParseType.JSONURL, parseString: self.textView.text)
					if let item = dic_{
						var string_dic : NSString! = JNYJJSONDic.dic2JSONString(dictionary: item)
						if let value = string_dic{
							self.textView.text = value
							return
						}
					}
				}
				self.textView.text = "Parse failed..."
			}
		}
	}
}

