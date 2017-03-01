//
//  Weather.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/26/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import Foundation

class Weather {
    private var _location: String!
    private var _date: String!
    private var _temp: Double!
    private var _condition: String!
    
    var location: String {
        get {
            return _location
        } set {
            _location = newValue
        }
    }
    
    var date: String{
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    
    var temp: Double {
        get {
            return _temp
        } set {
            _temp = newValue
        }
    }
    
    var condition: String {
        get {
            return _condition
        } set {
            _condition = newValue
        }
    }
    
    init() {
        //Do nothing
    }
    
}
