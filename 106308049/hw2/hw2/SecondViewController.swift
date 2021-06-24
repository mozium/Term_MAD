//
//  SecondViewController.swift
//  AirportList
//
//  Created by 林猷靖 on 2021/4/18.
//

import UIKit

class SecondViewController: UIViewController {

    
    //var text = ""
    var airportName: String?    //airportName as text
    var airportLocation: String?    //locationName as text
    var code: String?   //airportCode as text
    var abbreviation: String?   //airportShortName as text
    var imageName: String? //imageName as String
    
    @IBOutlet weak var airportimage: UIImageView! //name of UIImage
    @IBOutlet weak var name: UILabel!   //name of UILabel
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var IATA: UILabel!
    @IBOutlet weak var shortName: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        name.text = airportName //UILabel的text = String格式的airportName
        location.text = airportLocation
        IATA.text = code
        shortName.text = abbreviation
        airportimage.image = UIImage(named: "\(imageName ?? "")")
        
        self.title = code
        
    }
}
