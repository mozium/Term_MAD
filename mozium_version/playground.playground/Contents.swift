import UIKit

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
