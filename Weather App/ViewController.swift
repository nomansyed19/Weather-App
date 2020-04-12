//
//  ViewController.swift
//  Weather App
//
//  Created by Noman Syed on 4/11/20.
//  Copyright © 2020 Noman Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // This method runs right when the app is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
    }

    
    // run this method after use pressed search button
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)    // close the keyBoard
        
    }
    
    // run this method after user presses search button on they keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(searchTextField.text != nil){    // if textfield has texts then print and close the keyboard
            print(searchTextField.text!)
            searchTextField.endEditing(true)    // close the keyBoard
            return true;                        // then we allow user to press the search button on the keyboard
        }
        else{                                   // the textbox has no text inside it so we do not do not let them press the return button
            return false;
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != nil){         // if the textField has text then let user end editing
            return true;
        }
        else{
            textField.placeholder = "Enter city"
            return false;
        }
    }
    
    
    
    
    
    
    // run this fuction after user is done editing text field
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = "";      // clears the textbox after finished editing
    }
    
}
