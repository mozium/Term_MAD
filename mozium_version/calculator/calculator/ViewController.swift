//
//  ViewController.swift
//  calculator
//
//  Created by Cheng-Hsi Yang on 2021/3/28.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var display: UILabel!
	
	var pre: Float = 0.0
	var cur: String = ""
	var op: Bool = false // "true" means to calculate the result.
	var pre_op: Bool = false // "true" means the former input is an operator, do nothing.
							 // "false" means number, update.
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	func function() -> Void {
		// TO-DO: four-digit limitation
		if (pre_op == false) {
		}
		refresh()
		op = false // the following two lines are to reset the function.
		pre_op = false
	}
	
	func refresh () -> Void {
		// the following function would determine the displayed information
		if (pre_op == false) {
			cur = ""
		} else {
			cur = cur + "" // TO-DO
		}
		
		display.text = String(cur) // refresh the displayed text
	}
	
	func stringToInt (stringNum: String) -> Int {
		let result: Int! = Int(stringNum.components(separatedBy: ".")[0])
		return result
	}
	
	@IBAction func btn_clear(_ sender: Any) {
		pre = 0.0
		cur = ""
	}
	
	@IBAction func btn_mod(_ sender: Any) {
		// due to the limitation of Swift, it will convert 'pre' and 'cur' to integers first
		let dividend: Int = Int(pre)
		let divisor: Int = stringToInt(stringNum: cur)
		let result: Int = dividend % divisor
		cur = String(result)
		pre = Float(result)
		function() // TO-DO
				   // is this still necessary?
	}

	@IBAction func btn_plus(_ sender: Any) {
		let addend0: Float = pre
		let addend1: Float! = Float(cur) //TO-DO
		let result: Float = addend0 + addend1
		cur = String(result)
		pre = result
		function() //TO-DO
	}
	
	@IBAction func btn_minus(_ sender: Any) {
		let minuend: Float = pre
		let subtrahend: Float! = Float(cur) //TO-DO
		let result: Float = minuend - subtrahend
		cur = String(result)
		pre = result
		function() //TO-DO
	}
	
	@IBAction func btn_multiply(_ sender: Any) {
		let multiplicand: Float = pre
		let multiplier: Float! = Float(cur) //TO-DO
		let result: Float = multiplicand * multiplier
		cur = String(result) // because more multiplication/division could come
		function() //TO-DO
	}

	@IBAction func btn_divide(_ sender: Any) {
		let dividend: Float = pre
		let divisor: Float! = Float(cur) //TO-DO
		let result: Float = dividend / divisor
		cur = String(result)
		function() //TO-DO
	}
	
	@IBAction func btn_equal(_ sender: Any) {
		function() //TO-DO
	}
	
	@IBAction func btn_7(_ sender: Any) {
		cur += "7"
		function()
	}
	
	@IBAction func btn_8(_ sender: Any) {
		cur += "8"
		function()
	}
	
	@IBAction func btn_9(_ sender: Any) {
		cur += "9"
		function()
	}
	
	@IBAction func btn_4(_ sender: Any) {
		cur += "4"
		function()
	}
	
	@IBAction func btn_5(_ sender: Any) {
		cur += "5"
		function()
	}
	
	@IBAction func btn_6(_ sender: Any) {
		cur += "6"
		function()
	}
	
	@IBAction func btn_1(_ sender: Any) {
		cur += "1"
		function()
	}
	
	@IBAction func btn_2(_ sender: Any) {
		cur += "2"
		function()
	}
	
	@IBAction func btn_3(_ sender: Any) {
		cur += "3"
		function()
	}
	
	@IBAction func btn_0(_ sender: Any) {
		cur += "0"
		function()
	}
	
	@IBAction func btn_dot(_ sender: Any) {
		cur += "."
		function()
	}
}

