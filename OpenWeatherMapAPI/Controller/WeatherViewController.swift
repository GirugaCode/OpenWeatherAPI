//
//  WeatherViewController.swift
//  OpenWeatherMapAPI
//
//  Created by Ryan Nguyen on 8/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Alamofire
import UIKit

class WeatherViewController: UIViewController {
    
    var temp = 0.0
    var mood: String = ""
    
    let urlString = "https://api.openweathermap.org/data/2.5/weather?"
    let APIKey = "e0a6a747a5c90eac450a2f892dd53379"
    

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var weatherInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        getWeatherData()
        
        moodLabel.text = mood
    }
    
    func getWeatherData() {
        
        DispatchQueue.main.async {
            // format: http://api.openweathermap.org/data/2.5/weather?lat=42.365486&lon=71.103802&APPID=yourAPIKey
            Alamofire.request(self.urlString + "lat=\(42.365486)" + "&lon=\(71.103802)" + "&units=imperial" + "&APPID=\(self.APIKey)", method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                        
                    case .success(let JSON):
                        let main = JSON as! NSDictionary
                        self.temp = (main["main"] as! [String: Any])["temp"]! as! Double
                        print("response:\n", self.temp)
                        self.weatherInfo.text = self.temp.toString()
                        
                        
                    case .failure(let error):
                        print("Sensor Failiure:",error)
                    }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}
