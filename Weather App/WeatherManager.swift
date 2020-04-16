//
//  WeatherManager.swift
//  Weather App
//
//  Created by Noman Syed on 4/11/20.
//  Copyright © 2020 Noman Syed. All rights reserved.
//  This class is created to handle all data from the URLString that is created with openweather.org
//  It will handle all of the backend of the data coming from openweather using their API


import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,_ weather: WeatherModel)
    func didFailWithError(error: Error)
}


class WeatherManager {
    // 1 .create a URL string
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=6876e585bc8035465fe53c1805fdf220&units=imperial"
    var delegate: WeatherManagerDelegate?
    
    // this method will fetch the weather
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    // This method will perform a request// helper method for fetchWeather method. WIll take the actual city url and
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString){// create a url object // if the urlString is correct then run this block of code
            // create a URL session
            let session = URLSession(configuration: .default)
            
            
            // give session a task   // completion handler is a method ran while the session gets the data
            let task = session.dataTask(with: url) { (data, response, error) in
                if (error != nil){  // if there is an error/// then print the error
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){         // weather now has swift object live data
                        self.delegate?.didUpdateWeather(self,weather)           // delegate function
                    }
                }
            }
            // start the task
           task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            // gets the live data from the JSON
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let description = decodedData.weather[0].description
            // Store the live weather data into a structure in this case id,cityname,temp are being stored
            // in the weatherModel object called weather,
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp, description: description)
            return weather          // were returning this weather information object back to "data"
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
    
    
}
