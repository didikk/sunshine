//
//  Location.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 3/1/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
