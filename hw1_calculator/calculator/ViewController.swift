//
//  ViewController.swift
//

import UIKit

enum OperationType{
    case add
    case substract
    case multiply
    case divide
    case remain
    case none
}

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation:OperationType = .none
    var startNew = true

    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func add(_ sender: UIButton) {
        label.text = "+"
        operation = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func substract(_ sender: UIButton) {
        label.text = "-"
        operation = .substract
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "x"
        operation = .multiply
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        operation = .divide
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func remain(_ sender: UIButton) {
        label.text = "%"
        operation = .remain
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath == true{
            switch operation{
            case .add:
                numberOnScreen = previousNumber + numberOnScreen
                makeOkNumberString(from: numberOnScreen)
            case .substract:
                numberOnScreen = previousNumber - numberOnScreen
                makeOkNumberString(from: numberOnScreen)
            case .multiply:
                numberOnScreen = previousNumber * numberOnScreen
                makeOkNumberString(from: numberOnScreen)
            case .divide:
                numberOnScreen = previousNumber / numberOnScreen
                makeOkNumberString(from: numberOnScreen)
            case .remain:
                let a = Int(previousNumber) % Int(numberOnScreen)
                numberOnScreen = Double(a)
//                numberOnScreen = Int(previousNumber) % Int(numberOnScreen)
                makeOkNumberString(from: numberOnScreen)
            case .none:
                label.text = "0"
            }
            performingMath = false
            startNew = true
        }
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if label.text != nil{
            if startNew == true{
                label.text = "\(inputNumber)"
                startNew = false
            }else{
                if label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/" || label.text == "%" {
                    label.text = "\(inputNumber)"
                }else{
                    label.text = label.text! + "\(inputNumber)"
                }
            }
            numberOnScreen = Double(label.text!) ?? 0
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        startNew = true
    }
    
    func makeOkNumberString(from number:Double){
        var okText: String
        
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 8{
            okText = String(okText.prefix(8))
        }
        label.text = okText
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

