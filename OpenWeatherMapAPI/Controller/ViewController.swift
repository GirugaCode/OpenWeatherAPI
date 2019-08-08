//
//  ViewController.swift
//  OpenWeatherMapAPI
//
//  Created by Ryan Nguyen on 8/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moodTextField: UITextField!
    
    @IBAction func submitMoodbtn(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "weatherVC" {
            let vc = segue.destination as! WeatherViewController
            vc.mood = moodTextField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

