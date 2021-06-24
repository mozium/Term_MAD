//
//  ViewController.swift
//  AirportList
//
//  Created by CHI on 2021/4/8.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource {
    var airports: [Airport] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        //print(self.airports)
        // 委任指派
        tableView.delegate = self
        tableView.dataSource = self

        self.title = "Airport List"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath) as! AirportCell
        
        let airport = airports[indexPath.row]
        cell.airportImageView.image = UIImage(named: airport.Image)
        cell.nameLabel.text = airport.Airport
        cell.countryLabel.text = airport.Country
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "GoDetail":
            
            let page = segue.destination as? SecondViewController
            //page?.text = (sender as? String ?? "air") //??給預設值
            
            if let row = tableView.indexPathForSelectedRow?.row{
                page?.airportName = airports[row].Airport
                page?.airportLocation = airports[row].Country
                page?.code = airports[row].IATA
                page?.abbreviation = airports[row].ShortName
                page?.imageName = airports[row].Image
            }
            
        default:
            break
        }
    }
}

extension ViewController {
    private func fetchData() {
        guard let path = Bundle.main.path(forResource: "airports", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let airports = try? PropertyListDecoder().decode([Airport].self, from: xml) else {
            return
        }
        self.airports = airports
        tableView.reloadData()
    }
    
    struct Airport: Decodable {
        var Airport: String // 機場名稱
        var Country: String // 國家
        var IATA: String // 識別碼
        var Image: String // 圖片名稱
        var ServedCity: String // 城市
        var ShortName: String // 簡稱
    }
}

