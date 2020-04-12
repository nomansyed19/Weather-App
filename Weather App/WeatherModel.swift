//
//  WeatherModel.swift
//  Weather App
//
//  Created by Noman Syed on 4/12/20.
//  Copyright © 2020 Noman Syed. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double

    
    var temperatureString: String{
        return String(Int(temperature))
    }
    
    
    var conditionName: String{
        switch conditionID {
            case 801...804:
                return "cloud.bolt"
            case 800:
                return "sun.max"
            case 600...622:
                return "cloud.snow"
            case 500...531:
                return "cloud.rain"
            case 701...781:
                return "cloud.fog"
            case 300...321:
                return "cloud.drizzle"
            case 200...232:
                return "cloud.bolt"
            default:
                return "cloud"
        }
    
    }

}
