//
//  WeatherManager.swift
//  Weather App
//
//  Created by Noman Syed on 4/11/20.
//  Copyright © 2020 Noman Syed. All rights reserved.
//  This class is created to handle all data from the URLString that is created with openweather.org
//  It will handle all of the backend of the data coming from openweather using their API


import UIKit

class WeatherManager {
    // 1 .create a URL string
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=6876e585bc8035465fe53c1805fdf220&units=imperial"
    
    
    // this method will fetch the weather
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    // This method will perform a request// helper method for fetchWeather method. WIll take the actual city url and
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString){// create a url object // if the urlString is correct then run this block of code
            // create a URL session
            let session = URLSession(configuration: .default)
            
            
            // give session a task   // completion handler is a method ran while the session gets the data
            let task = session.dataTask(with: url) { (data, response, error) in
                if (error != nil){  // if there is an error/// then print the error
                    print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            // start the task
           task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        }
        catch{
            print(error)
        }
    }
    
    
    
    
    
    
}
