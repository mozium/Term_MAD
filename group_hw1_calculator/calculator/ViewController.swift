//
//  ViewController.swift
//  calculator
//
//  Created by Cheng-Hsi Yang on 2021/3/28.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var display: UILabel!

	var ram: Float = 0.0 // for sequential calculation
	var pre: Float = 0.0
	var cur: String = ""
	var input_type: Bool = false // to indicate whether it is a number or an operator
	var oper_type: Int = 0 // to indicate whether it is +, -, *, or /
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
		
		display.text = String(cur) // refresh the displayed text
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
			let multiplicand: Float = pre
			let multiplier: Float! = Float(cur) //TO-DO
			let result: Float = multiplicand * multiplier
			cur = String(result) // because more multiplication/division could come
		case 4:
			// division
			let dividend: Float = pre
			let divisor: Float! = Float(cur) //TO-DO
			let result: Float = dividend / divisor
			cur = String(result)
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

	
	@IBAction func btn_clear(_ sender: Any) {
		ram = 0.0
		pre = 0.0
		cur = ""
		oper_type = 0
		refresh()
	}

	@IBAction func btn_plus(_ sender: Any) {
		oper_type = 1
		refresh()
	}
	
	@IBAction func btn_minus(_ sender: Any) {
		oper_type = 2
		refresh()
	}
	
	@IBAction func btn_multiply(_ sender: Any) {
		oper_type = 3
		refresh()
	}
	
	@IBAction func btn_divide(_ sender: Any) {
		oper_type = 4
		refresh()
	}
	
	@IBAction func btn_mod(_ sender: Any) {
		oper_type = 5
		refresh()
	}
	
	@IBAction func btn_equal(_ sender: Any) {
		if (cur != "") {
			calculate(type: oper_type)
		}
		refresh()
	}
	
	@IBAction func btn_7(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "7"
			refresh()
		}
	}
	
	@IBAction func btn_8(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "8"
			refresh()
		}
	}
	
	@IBAction func btn_9(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "9"
			refresh()
		}
	}
	
	@IBAction func btn_4(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "4"
			refresh()
		}
	}
	
	@IBAction func btn_5(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "5"
			refresh()
		}
	}
	
	@IBAction func btn_6(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "6"
			refresh()
		}
	}
	
	@IBAction func btn_1(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "1"
			refresh()
		}
	}
	
	@IBAction func btn_2(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "2"
			refresh()
		}
	}
	
	@IBAction func btn_3(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "3"
			refresh()
		}
	}
	
	@IBAction func btn_0(_ sender: Any) {
		if (number_lock(numString: cur)) {
			// do nothing
		} else {
			cur += "0"
			refresh()
		}
	}
	
	@IBAction func btn_dot(_ sender: Any) {
		if (dot_lock == false) {
			if (cur != "") {
				cur += "."
			}
		}
		dot_lock = true
		refresh()
	}
	
	func stringToInt (stringNum: String) -> Int {
		let result: Int! = Int(stringNum.components(separatedBy: ".")[0])
		return result
	}
	
	func stringToFloat (stringNum: String) -> Float {
		let result: Float! = Float(stringNum)
		return result
	}
}
