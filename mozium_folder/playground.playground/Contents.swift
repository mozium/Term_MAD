import UIKit

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
