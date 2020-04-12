//
//  WeatherData.swift
//  Weather App
//
//  Created by Noman Syed on 4/11/20.
//  Copyright © 2020 Noman Syed. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name : String                                           // name of the city
    let main : Main
}


struct Main: Decodable {
    let temp: Double
    
}
