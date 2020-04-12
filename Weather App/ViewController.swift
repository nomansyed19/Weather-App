//
//  ViewController.swift
//  Weather App
//
//  Created by Noman Syed on 4/11/20.
//  Copyright © 2020 Noman Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionViewImage: UIImageView!
    
    // create weatherManager object
    var weatherManager = WeatherManager()
    

    
    
    // This method runs right when the app is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    
    // run this method after use pressed search button
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)    // close the keyBoard
        
    }
    
    // run this method after user presses search button on they keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(searchTextField.text != nil){    // if textfield is empty then print and close the keyboard
            searchTextField.endEditing(true)    // close the keyBoard
            return true;
        }
        else{
            return false;
        }
    }
    
    // run this fuction after user is done editing text field
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = "";      // clears the textbox after finished editing
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.conditionViewImage.image = UIImage(systemName: weather.conditionName)
            print(weather.temperatureString)
            
        }

    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
