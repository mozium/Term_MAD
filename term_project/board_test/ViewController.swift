//
//  ViewController.swift
//  board_test
//
//  Created by 林猷靖 on 2021/6/21.
//

import UIKit

typealias loc = (m:Int, n:Int)

func draw(arr:Array<Array<Int>>)
{
    for array in arr
    {
        for value in array
        {
            print(value, terminator: " ")
        }
        print(" ")
    }
}

class ViewController: UIViewController {
    
    func initialize()
        {
            for i in stride(from: 0, to: 8, by: 1)
            {
                for j in stride(from: 0, to: 8, by: 1)
                {
                    board[i][j] = 0
                }
            }
            
            board[3][3] = 1
            board[4][4] = 1
            board[3][4] = 2
            board[4][3] = 2
        }
    
    func decode(tag: Int) -> (row:Int, col:Int)
    {
        let result = tag.quotientAndRemainder(dividingBy: 8)
        return (result.remainder, result.quotient)
    }
    
    func placement(arr:Array<Array<Int>>, char:Int, row:Int, col:Int)
    {
        var flip: [loc] = []
        var tar = 1
        
        if (char == 1)
        {
            tar = 2
        }
        
        flip += top(arr: arr, tar: tar, i: row, col: col)
        flip += down(arr: arr, tar: tar, i: row, col: col)
        flip += left(arr: arr, tar: tar, row: row, j: col)
        flip += right(arr: arr, tar: tar, row: row, j: col)
        flip += topLeft(arr: arr, tar: tar, i: row, j: col)
        flip += topRight(arr: arr, tar: tar, i: row, j: col)
        flip += downLeft(arr: arr, tar: tar, i: row, j: col)
        flip += downRight(arr: arr, tar: tar, i: row, j: col)
        
        for i in stride(from:0, to:flip.count, by:1)
        {
            board[flip[i].m][flip[i].n] = char
        }

        board[row][col] = char
        draw(arr: board)
    }

    
    func dashboard(arr:Array<Array<Int>>)
    {
        var p1: Int = 0
        var p2: Int = 0
        
        for i in stride(from: 0, to: 8, by: 1)
        {
            for j in stride(from: 0, to: 8, by: 1)
            {
                if (arr[i][j] == 1)
                {
                    p1 += 1
                }
                if (arr[i][j] == 2)
                {
                    p2 += 1
                }
            }
        }
        blackPoint.text = String(p1)
        whitePoint.text = String(p2)
        
        print(p1)
        print(p2)
        
        if p1 + p2 == 64{
            //print("Win64")
            performSegue(withIdentifier: "GoSecond", sender: nil)
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "GoSecond":
            
            refresh_button_oulet.tintColor = .gray
            
            let page = segue.destination as? secondViewController
            
            if Int(blackPoint.text!)! > Int(whitePoint.text!)! {
                page?.text = (sender as? String ?? "Black Win!")
            }
            else if Int(blackPoint.text!)! < Int(whitePoint.text!)! {
                page?.text = (sender as? String ?? "White Win!")
            }
            else{
                page?.text = (sender as? String ?? "Tie Game!")
            }
        
        default:
            break
        }
    }


    func top(arr:Array<Array<Int>>, tar:Int, i:Int, col:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var row: Int = i
        
        while (row-1 >= 0)
        {
            let cur = arr[row-1][col]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row-1, col))
                row -= 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func down(arr:Array<Array<Int>>, tar:Int, i:Int, col:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var row: Int = i
        
        while (row+1 <= 7)
        {
            let cur = arr[row+1][col]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row+1, col))
                row += 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func left(arr:Array<Array<Int>>, tar:Int, row:Int, j:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var col: Int = j
        
        while (col-1 >= 0)
        {
            let cur = arr[row][col-1]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row, col-1))
                col -= 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func right(arr:Array<Array<Int>>, tar:Int, row:Int, j:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var col: Int = j
        
        while (col+1 <= 7)
        {
            let cur = arr[row][col+1]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row, col+1))
                col += 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func topLeft(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var row: Int = i
        var col: Int = j
        
        while (row-1 >= 0 && col-1 >= 0)
        {
            let cur = arr[row-1][col-1]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row-1, col-1))
                row -= 1
                col -= 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func topRight(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var row: Int = i
        var col: Int = j
        
        while (row-1 >= 0 && col+1 <= 7)
        {
            let cur = arr[row-1][col+1]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row-1, col+1))
                row -= 1
                col += 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func downLeft(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var row: Int = i
        var col: Int = j
        
        while (row+1 <= 7 && col-1 >= 0)
        {
            let cur = arr[row+1][col-1]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row+1, col-1))
                row += 1
                col -= 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    func downRight(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
    {
        var pot: [loc] = []
        var row: Int = i
        var col: Int = j
        
        while (row+1 <= 7 && col+1 <= 7)
        {
            let cur = arr[row+1][col+1]

            if cur == 0
            {
                return []
            }
            else if (cur == tar)
            {
                pot.append((row+1, col+1))
                row += 1
                col += 1
            }
            else
            {
                return pot
            }
        }

        return []
    }

    var isBlack:Bool = true
    
    @IBOutlet weak var who: UILabel!

    @IBOutlet weak var a11: UIButton!
    @IBOutlet weak var a21: UIButton!
    @IBOutlet weak var a31: UIButton!
    @IBOutlet weak var a41: UIButton!
    @IBOutlet weak var a51: UIButton!
    @IBOutlet weak var a61: UIButton!
    @IBOutlet weak var a71: UIButton!
    @IBOutlet weak var a81: UIButton!
    @IBOutlet weak var a12: UIButton!
    
    @IBOutlet weak var blackPoint: UILabel!
    @IBOutlet weak var whitePoint: UILabel!
    @IBOutlet weak var leftRed: UIImageView!
    @IBOutlet weak var rightRed: UIImageView!
    @IBOutlet weak var leftHand: UIImageView!
    @IBOutlet weak var rightHand: UIImageView!
    
    @IBAction func choose(_ sender: Any) {
        
        if isBlack == true{
            leftRed.alpha = 0
            rightRed.alpha = 1
            leftHand.alpha = 0
            rightHand.alpha = 1
            
            (sender as! UIButton).tintColor = .black
            isBlack = false
            placement(arr: board, char: 1, row: decode(tag: (sender as! UIView).tag).row, col: decode(tag: (sender as! UIView).tag).col)
            print(draw(arr: board))
            flip()
            dashboard(arr: board)
        }
        
        else{
            leftRed.alpha = 1
            rightRed.alpha = 0
            leftHand.alpha = 1
            rightHand.alpha = 0
            
            (sender as! UIButton).tintColor = .white
            isBlack = true
            placement(arr: board, char: 2, row: decode(tag: (sender as! UIView).tag).row, col: decode(tag: (sender as! UIView).tag).col)
            print(draw(arr: board))
            flip()
            dashboard(arr: board)
        }
        
        (sender as! UIButton).isEnabled = false
        

        if isBlack == true{
            who.text = "Black"
            //print(isBlack)
        }
        else{
            who.text = "White"
            //print(isBlack)
        }
    }
    
    
    @IBOutlet weak var a22: UIButton!
    @IBOutlet weak var a32: UIButton!
    @IBOutlet weak var a42: UIButton!
    @IBOutlet weak var a52: UIButton!
    @IBOutlet weak var a62: UIButton!
    @IBOutlet weak var a72: UIButton!
    @IBOutlet weak var a82: UIButton!
    
    @IBOutlet weak var a13: UIButton!
    @IBOutlet weak var a23: UIButton!
    @IBOutlet weak var a33: UIButton!
    @IBOutlet weak var a43: UIButton!
    @IBOutlet weak var a53: UIButton!
    @IBOutlet weak var a63: UIButton!
    @IBOutlet weak var a73: UIButton!
    @IBOutlet weak var a83: UIButton!
    
    @IBOutlet weak var a14: UIButton!
    @IBOutlet weak var a24: UIButton!
    @IBOutlet weak var a34: UIButton!
    @IBOutlet weak var a44: UIButton!
    @IBOutlet weak var a54: UIButton!
    @IBOutlet weak var a64: UIButton!
    @IBOutlet weak var a74: UIButton!
    @IBOutlet weak var a84: UIButton!
    
    @IBOutlet weak var a15: UIButton!
    @IBOutlet weak var a25: UIButton!
    @IBOutlet weak var a35: UIButton!
    @IBOutlet weak var a45: UIButton!
    @IBOutlet weak var a55: UIButton!
    @IBOutlet weak var a65: UIButton!
    @IBOutlet weak var a75: UIButton!
    @IBOutlet weak var a85: UIButton!
    
    @IBOutlet weak var a16: UIButton!
    @IBOutlet weak var a26: UIButton!
    @IBOutlet weak var a36: UIButton!
    @IBOutlet weak var a46: UIButton!
    @IBOutlet weak var a56: UIButton!
    @IBOutlet weak var a66: UIButton!
    @IBOutlet weak var a76: UIButton!
    @IBOutlet weak var a86: UIButton!
    
    @IBOutlet weak var a17: UIButton!
    @IBOutlet weak var a27: UIButton!
    @IBOutlet weak var a37: UIButton!
    @IBOutlet weak var a47: UIButton!
    @IBOutlet weak var a57: UIButton!
    @IBOutlet weak var a67: UIButton!
    @IBOutlet weak var a77: UIButton!
    @IBOutlet weak var a87: UIButton!
    
    @IBOutlet weak var a18: UIButton!
    @IBOutlet weak var a28: UIButton!
    @IBOutlet weak var a38: UIButton!
    @IBOutlet weak var a48: UIButton!
    @IBOutlet weak var a58: UIButton!
    @IBOutlet weak var a68: UIButton!
    @IBOutlet weak var a78: UIButton!
    @IBOutlet weak var a88: UIButton!
    
    @IBOutlet weak var refresh_button_oulet: UIButton!
    @IBAction func refresh_button(_ sender: Any) {
        initialize()
        print("restart")
        blackPoint.text = "2"
        whitePoint.text = "2"
        leftRed.alpha = 1
        rightRed.alpha = 0
        leftHand.alpha = 1
        rightHand.alpha = 0
        who.text = "Black"
        
        a11.tintColor = UIColor(red: 1/255, green: 113/255, blue: 1/255, alpha: 1)
        a11.isEnabled = true
        
        for i in 1...63{
                   switch board[decode(tag: i).row][decode(tag: i).col]{
                   
                   case 0:
                    let butt = view.viewWithTag(i) as! UIButton
                    butt.tintColor = UIColor(red: 1/255, green: 113/255, blue: 1/255, alpha: 1)
                    butt.isEnabled = true

                   case 1:
                    let butt = view.viewWithTag(i) as! UIButton
                    butt.tintColor = .black
                    butt.isEnabled = true
                    
                   case 2:
                    let butt = view.viewWithTag(i) as! UIButton
                    butt.tintColor = .white
                    butt.isEnabled = true

                   default: break
                   }
        }
    }
    
    var board = Array(repeating: Array(repeating: 0, count: 8), count: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        flip()
        
        a44.isEnabled = false
        a54.isEnabled = false
        a45.isEnabled = false
        a55.isEnabled = false
        
}
    func flip(){
     
        for i in 1...63{
                   switch board[decode(tag: i).row][decode(tag: i).col]{
                   case 0:
                       break

                   case 1:
                    let butt = view.viewWithTag(i) as! UIButton
                            butt.tintColor = .black
                    
                   case 2:
                    let butt = view.viewWithTag(i) as! UIButton
                            butt.tintColor = .white

                   default: break
                    
                   }
                }
    }
}
