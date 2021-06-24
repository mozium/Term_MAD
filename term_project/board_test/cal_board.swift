//
//  cal_board.swift
//  board_test
//
//  Created by 林猷靖 on 2021/6/21.
//

import UIKit







//
//class test {
//
//
//
//    func draw(arr:Array<Array<Int>>)
//    {
//        for array in arr {
//            for value in array {
//                print(value, terminator: " ")
//            }
//            print(" ")
//        }
//    }
//
//    draw(arr: board)
//
//    func top(arr:Array<Array<Int>>, tar:Int, i:Int, col:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var row: Int = i
//
//        while (row-1 >= 0)
//        {
//            let cur = arr[row-1][col]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row-1, col))
//                row -= 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//    // print(top(arr:board, tar:1, i:5, col:4)[0].m)
//
//    func down(arr:Array<Array<Int>>, tar:Int, i:Int, col:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var row: Int = i
//
//        while (row+1 <= 7)
//        {
//            let cur = arr[row+1][col]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row+1, col))
//                row += 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func left(arr:Array<Array<Int>>, tar:Int, row:Int, j:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var col: Int = j
//
//        while (col-1 >= 0)
//        {
//            let cur = arr[row][col-1]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row, col-1))
//                col -= 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func right(arr:Array<Array<Int>>, tar:Int, row:Int, j:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var col: Int = j
//
//        while (col+1 <= 7)
//        {
//            let cur = arr[row][col+1]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row, col+1))
//                col += 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func topLeft(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var row: Int = i
//        var col: Int = j
//
//        while (row-1 >= 0 && col-1 >= 0)
//        {
//            let cur = arr[row-1][col-1]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row-1, col-1))
//                row -= 1
//                col -= 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func topRight(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var row: Int = i
//        var col: Int = j
//
//        while (row-1 >= 0 && col+1 <= 7)
//        {
//            let cur = arr[row-1][col+1]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row-1, col+1))
//                row -= 1
//                col += 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func downLeft(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var row: Int = i
//        var col: Int = j
//
//        while (row+1 <= 7 && col-1 >= 0)
//        {
//            let cur = arr[row+1][col-1]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row+1, col-1))
//                row += 1
//                col -= 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func downRight(arr:Array<Array<Int>>, tar:Int, i:Int, j:Int) -> Array<loc>
//    {
//        var pot: [loc] = []
//        var row: Int = i
//        var col: Int = j
//
//        while (row+1 <= 7 && col+1 <= 7)
//        {
//            let cur = arr[row+1][col+1]
//
//            if cur == 0
//            {
//                return []
//            }
//            else if (cur == tar)
//            {
//                pot.append((row+1, col+1))
//                row += 1
//                col += 1
//            }
//            else
//            {
//                return pot
//            }
//        }
//
//        return []
//    }
//
//    func placement(arr:Array<Array<Int>>, char:Int, row:Int, col:Int)
//    {
//        var flip: [loc] = []
//        var tar = 1
//
//        if (char == 1)
//        {
//            tar = 2
//        }
//
//        flip += top(arr: arr, tar: tar, i: row, col: col)
//        flip += down(arr: arr, tar: tar, i: row, col: col)
//        flip += left(arr: arr, tar: tar, row: row, j: col)
//        flip += right(arr: arr, tar: tar, row: row, j: col)
//        flip += topLeft(arr: arr, tar: tar, i: row, j: col)
//        flip += topRight(arr: arr, tar: tar, i: row, j: col)
//        flip += downLeft(arr: arr, tar: tar, i: row, j: col)
//        flip += downRight(arr: arr, tar: tar, i: row, j: col)
//
//        for i in stride(from:0, to:flip.count, by:1)
//        {
//            board[flip[i].m][flip[i].n] = char
//        }
//
//        board[row][col] = char
//        draw(arr: board)
//    }
//
//    placement(arr: board, char: 1, row: 3, col: 3)
//
//
//    //var board = Array(repeating: Array(repeating: 0, count: 8), count: 8)
//    //var board = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: 0))
//
//}
