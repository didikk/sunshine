//
//  WeatherCell.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/26/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!

    func configureCell(weather: Weather){
        dayLabel.text = weather.date
        conditionLabel.text = weather.condition
        tempLabel.text = "\(weather.temp)°"
    }

}
