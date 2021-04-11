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
	var ram: Float = 0.0 // store on-going calculation temporarily
	var cur: String = ""
	var input_type: Bool = false // to indicate whether it is a number or an operator
	var sequential: Bool = false // change displaying behavior for sequential calculation
	var oper_type: Int = 0 // to indicate whether it is +, -, *, or /
	var preoper_type: Int = 0 // for sequential calculation
	var pre_input: Bool = false // to indicate whether the previous input is a number or an operater
	var is_result: Bool = false // to indicate whether it is a culculated result
	var dot_lock: Bool = false // to limit decimal point input
	var num_lock: Bool = false // to indicate whether the number has become too lengthy
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func number_lock (numString: String) -> Bool {
		if numString.contains(".") { // 2-digit after decimal point
			let check = numString.components(separatedBy: ".")
			if (check[1].count == 2) {
				return true
			}
		} else { // 4-digit before decimal point
			if numString.count == 4 {
				return true
			}
		}
		return false
	}
	
	func refresh () -> Void {
		if (pre != 0.0 && cur != "") {
			if (input_type == false && pre_input == false) { // input a number, previously as well
				// update the current number
				cur = cur + "" // TO-DO
			} else if (input_type == true && pre_input == false) { //input operator, previously a number
				// here, the current number should be updated
				sequential = true
				if (oper_type == 1 || oper_type == 2) {
					calculate(type: preoper_type)
				} else if (oper_type == 3 || oper_type == 4) {
					calculate(type: oper_type)
				}
			} else if (input_type == true && pre_input == true) { // input operator, previously as well
				// here, simply change the operation mode
				// do nothing
			} else { // input number, previously an operator
				if (is_result == true) {
					let new_input: String = String(cur.suffix(1))
					cur = new_input
					is_result = false
				}
			}
		} else {
			if (input_type == false && pre_input == false) { // input a number, previously as well
				// update the current number
				cur = cur + "" // TO-DO
			} else if (input_type == true && pre_input == false) { //input operator, previously a number
				// here, the current number should be updated
				if (is_result != true) {
					pre = stringToFloat(stringNum: cur)
					cur = ""
				}
			} else if (input_type == true && pre_input == true) { // input operator, previously as well
				// here, simply change the operation mode
				// do nothing
			} else { // input number, previously an operator
				if (is_result == true) {
					pre = 0.0
					let new_input: String = String(cur.suffix(1))
					cur = new_input
					is_result = false
				}
			}
		}
				
		display.text = String(cur) // refresh the displayed text
		// for testing
		print(pre)
		print(cur)
		print(oper_type)
		print(sequential)
		print("-")
	}
	
	func calculate (type: Int) {
		switch type {
		case 1:
			// addition
			let addend0: Float = pre
			let addend1: Float! = Float(cur) //TO-DO
			let result: Float = addend0 + addend1
			cur = String(result)
			pre = result
		case 2:
			// subtraction
			let minuend: Float = pre
			let subtrahend: Float! = Float(cur) //TO-DO
			let result: Float = minuend - subtrahend
			cur = String(result)
			pre = result
		case 3:
			// multiplication
			if (sequential) {
				
			} else {
				let multiplicand: Float = pre
				let multiplier: Float! = Float(cur) //TO-DO
				let result: Float = multiplicand * multiplier
				cur = String(result) // because more multiplication/division could come
			}
		case 4:
			// division
			if (sequential) {
				
			} else {
				let dividend: Float = pre
				let divisor: Float! = Float(cur) //TO-DO
				let result: Float = dividend / divisor
				cur = String(result)
			}
		case 5:
			// modulus
			// due to the limitation of Swift, it will convert 'pre' and 'cur' to integers first
			let dividend: Int = Int(pre)
			let divisor: Int = stringToInt(stringNum: cur)
			let result: Int = dividend % divisor
			cur = String(result)
			pre = Float(result)
		default:
			oper_type = 0 // return the variable to non-specified status
		}
		is_result = true
	}
	
	func stringToInt (stringNum: String) -> Int {
		let result: Int! = Int(stringNum.components(separatedBy: ".")[0])
		return result
	}
	
	func stringToFloat (stringNum: String) -> Float {
		let result: Float! = Float(stringNum)
		return result
	}
	
	@IBAction func btn_clear(_ sender: Any) {
		pre = 0.0
		ram = 0.0
		cur = ""
		oper_type = 0
		refresh()
	}

	@IBAction func btn_plus(_ sender: Any) {
		input_type = true
		oper_type = 1
		refresh()
		preoper_type = 1
		pre_input = true
	}
	
	@IBAction func btn_minus(_ sender: Any) {
		input_type = true
		oper_type = 2
		refresh()
		preoper_type = 2
		pre_input = true
	}
	
	@IBAction func btn_multiply(_ sender: Any) {
		input_type = true
		oper_type = 3
		refresh()
		preoper_type = 3
		pre_input = true
	}
	
	@IBAction func btn_divide(_ sender: Any) {
		input_type = true
		oper_type = 4
		refresh()
		preoper_type = 4
		pre_input = true
	}
	
	@IBAction func btn_mod(_ sender: Any) {
		input_type = true
		oper_type = 5
		refresh()
		pre_input = true
	}
	
	@IBAction func btn_equal(_ sender: Any) {
		input_type = true
		if (cur != "") {
			calculate(type: oper_type)
		}
		refresh()
		pre_input = true
	}
	
	@IBAction func btn_7(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "7"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_8(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "8"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_9(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "9"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_4(_ sender: Any) {
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "4"
			refresh()
		}
	}
	
	@IBAction func btn_5(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "5"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_6(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "6"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_1(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "1"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_2(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "2"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_3(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "3"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_0(_ sender: Any) {
		input_type = false
		if (number_lock(numString: cur)) {
			
		} else {
			cur += "0"
			refresh()
		}
		pre_input = false
	}
	
	@IBAction func btn_dot(_ sender: Any) {
		input_type = false
		if (dot_lock == false) {
			if (cur != "") {
				cur += "."
			}
		}
		dot_lock = true
		refresh()
		pre_input = false
	}
}
