//
//  ViewController.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/25/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var repo: WeatherRepository = WeatherRepository()
    var weathers = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    
        repo.getWeather { weathers in
            for i in 0..<weathers.count {
                if i == 0 {
                    let curr = weathers[i]
                    self.locationLabel.text = curr.location
                    self.currentTempLabel.text = "\(curr.temp)°"
                    self.currentWeatherLabel.text = curr.condition
                    self.currentWeatherImage.image = UIImage(named: curr.condition)
                } else {
                    self.weathers.append(weathers[i])
                }
            }
            self.tableView.reloadData()
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weather = weathers[indexPath.row]
        cell.configureCell(weather: weather)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

