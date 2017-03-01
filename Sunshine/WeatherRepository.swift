//
//  WeatherRepository.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/26/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherRepository {
    func getWeather(completed: @escaping DownloadComplete){
        Alamofire.request(WEATHER_URL).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                
                var cityName: String = ""
                
                if let name = json["city"]["name"].string {
                    cityName = name
                }
                
                if let items = json["list"].array {
                    var weathers = [Weather]()
                    for item in items {
                        let weather = Weather()
                        weather.location = cityName
                        
                        if let dt = item["dt"].int64 {
                            let date = Date(timeIntervalSince1970: TimeInterval(dt))
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "EEEE"
                            
                            let convertedDate = dateFormatter.string(from: date)
                            weather.date = convertedDate
                        }
                        
                        if let temp = item["temp"]["day"].int{
                            weather.temp = Double(temp)
                        }
                        
                        if let condition = item["weather"][0]["main"].string {
                            weather.condition = condition
                        }
                        
                        weathers.append(weather)
                    }
                    
                    completed(weathers)
                }
            }
        }
    }

}
