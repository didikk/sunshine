//
//  Constants.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/26/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import Foundation

let WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?appid=a95bd90cef61122fbf6bc4f2ae216fb5&cnt=7&units=metric&lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)"


typealias DownloadComplete = ([Weather]) -> ()
