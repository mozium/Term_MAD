import UIKit
// HW1: Calculator Revision (for reference)
var ram: Float = 0.0 // for sequential calculation
var pre: Float = 0.0
var cur: String = ""
var input_type: Bool = false // to indicate whether it is a number or an operator
var operation: Bool = false // to determine what to display
var oper_type: Int = 0 // to indicate whether it is +, -, *, or /
var pre_input: Bool = false // to indicate whether the previous input is a number or an operater
var is_result: Bool = false // to indicate whether it is a culculated result
var dot_lock: Bool = false // to limit decimal point input
var num_lock: Bool = false // to indicate whether the number has become too lengthy

func stringToInt (stringNum: String) -> Int {
	let result: Int! = Int(stringNum.components(separatedBy: ".")[0])
	return result
}

func stringToFloat (stringNum: String) -> Float {
	let result: Float! = Float(stringNum)
	return result
}

func calculate (type: Int) {
	switch type {
	case 1:
		// addition
		let addend0: Float = pre
		let addend1: Float! = Float(cur)
		let result: Float = addend0 + addend1
		cur = String(result)
		pre = result
	case 2:
		// subtraction
		let minuend: Float = pre
		let subtrahend: Float! = Float(cur)
		let result: Float = minuend - subtrahend
		cur = String(result)
		pre = result
	case 3:
		// multiplication
		let multiplicand: Float = pre
		let multiplier: Float! = Float(cur)
		let result: Float = multiplicand * multiplier
		cur = String(result)
	case 4:
		// division
		let dividend: Float = pre
		let divisor: Float! = Float(cur)
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
		operation = false
	}
	operation = true
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
	// display.text = String(cur) // refresh the displayed text
}
	
// HW1: Calculator
var numstr = "1234.56"
var intstr = "1234"
var none = ""
var dot = "."
let check = numstr.components(separatedBy: ".")

check[1].count
numstr.contains(dot)

Float(numstr)
Float(intstr)
Float(none)
numstr.suffix(1)

// 1. let not "immutable"
var num: Int = 101
let text: String = "\(num)"
print(text)

num = 202
print(text)

// 2. how to append str? just like how it's done in Python!
var str: String = "101"
str += "0"
print(str)

// 3. testing the property of "mod"
var floatnum: Float = 11.1
Int(floatnum)

// 4.
var stringnum: String = "11.1"
stringnum.components(separatedBy: ".")[0]
Float(stringnum)
