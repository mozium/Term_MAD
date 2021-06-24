//
//  secondViewController.swift
//  board_test
//
//  Created by 林猷靖 on 2021/6/22.
//

import UIKit

class secondViewController: UIViewController {
        
    @IBOutlet weak var winText: UILabel!
    
    var text = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
        winText.text = text
  
    }

}
