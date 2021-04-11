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
	var oper_type: Int = 0 // to indicate whether it is +, -, *, or /
	var prev_input: Bool = false // false: numbers; true: operator
	var prev_oper: Bool = false // false: + or -; true: * or /
	var operation: Bool = false // to determine what to display
	var dot_lock: Bool = false // to limit decimal point input
	var num_lock: Bool = false // to indicate whether the number has become too lengthy
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func refresh () -> Void {


		if (operation) { // show result if calculated, show 'cur' when inputting
			display.text = String(ram)
			operation = false
		} else {
			display.text = String(cur)
		}
	}
	
	func preparation () -> Void {
		
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
			//calculate(type: oper_type)
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
	
	func stringToInt (stringNum: String) -> Int {
		let result: Int! = Int(stringNum.components(separatedBy: ".")[0])
		return result
	}
	
	func stringToFloat (stringNum: String) -> Float {
		let result: Float! = Float(stringNum)
		return result
	}
}
