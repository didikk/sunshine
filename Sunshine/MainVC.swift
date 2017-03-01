//
//  ViewController.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/25/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate{
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    var repo: WeatherRepository = WeatherRepository()
    var weathers = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.stopMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            print(Location.sharedInstance.latitude, Location.sharedInstance.longitude)
            
            getWeatherData()
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func getWeatherData(){
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

