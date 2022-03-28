//
//  ViewController.swift
//  lab03
//
//  Created by kun peng on 2022-03-26.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var daySymbolDic: [Int: String] = [:]
    var nightSymbolDic: [Int:String] = [:]
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSymbolDictionary()
        setDefaultView()
        searchTextField.delegate = self
        locationManager.delegate = self

    }

    private func setSymbolDictionary(){
        daySymbolDic[1000] = "sun.max.fill"
        daySymbolDic[1003] = "cloud.sun"
        daySymbolDic[1006] = "cloud"
        daySymbolDic[1009] = "cloud.fill"
        daySymbolDic[1030] = "cloud.fog"
        daySymbolDic[1063] = "cloud.sun.rain"
        daySymbolDic[1066] = "cloud.snow"
        daySymbolDic[1069] = "cloud.sleet"
        daySymbolDic[1072] = "cloud.hail"
        daySymbolDic[1087] = "cloud.sun.bolt"
        daySymbolDic[1114] = "wind.snow"
        daySymbolDic[1117] = "snowflake"
        daySymbolDic[1135] = "cloud.fog"
        daySymbolDic[1147] = "cloud.fog"
        daySymbolDic[1150] = "cloud.drizzle"
        daySymbolDic[1153] = "cloud.drizzle"
        daySymbolDic[1168] = "cloud.drizzle"
        daySymbolDic[1171] = "cloud.drizzle"
        daySymbolDic[1180] = "cloud.sun.rain"
        daySymbolDic[1183] = "cloud.rain"
        daySymbolDic[1186] = "cloud.sun.rain"
        daySymbolDic[1189] = "cloud.rain"
        daySymbolDic[1192] = "cloud.sun.rain"
        daySymbolDic[1195] = "cloud.heavyrain"
        daySymbolDic[1198] = "cloud.rain"
        daySymbolDic[1201] = "cloud.heavyrain"
        daySymbolDic[1204] = "cloud.sleet"
        daySymbolDic[1207] = "cloud.sleet"
        daySymbolDic[1210] = "cloud.snow"
        daySymbolDic[1213] = "cloud.snow"
        daySymbolDic[1216] = "cloud.snow"
        daySymbolDic[1219] = "cloud.snow"
        daySymbolDic[1222] = "cloud.snow"
        daySymbolDic[1225] = "cloud.snow"
        daySymbolDic[1237] = "snowflake.circle"
        daySymbolDic[1240] = "cloud.sun.rain"
        daySymbolDic[1243] = "cloud.sun.rain"
        daySymbolDic[1246] = "cloud.sun.rain"
        daySymbolDic[1249] = "cloud.sleet"
        daySymbolDic[1252] = "cloud.sleet"
        daySymbolDic[1255] = "cloud.snow"
        daySymbolDic[1258] = "cloud.snow"
        daySymbolDic[1261] = "snowflake.circle"
        daySymbolDic[1264] = "snowflake.circle"
        daySymbolDic[1273] = "cloud.sun.bolt"
        daySymbolDic[1276] = "cloud.bolt.rain"
        daySymbolDic[1279] = "cloud.sun.bolt"
        daySymbolDic[1282] = "cloud.sun.bolt"
        
        nightSymbolDic[1000] = "moon.fill"
        nightSymbolDic[1003] = "cloud.moon"
        nightSymbolDic[1006] = "cloud.moon.fill"
        nightSymbolDic[1009] = "cloud.fill"
        nightSymbolDic[1030] = "cloud.fog.fill"
        nightSymbolDic[1063] = "cloud.moon.rain.fill"
        nightSymbolDic[1066] = "cloud.snow.fill"
        nightSymbolDic[1069] = "cloud.sleet.fill"
        nightSymbolDic[1072] = "cloud.hail.fill"
        nightSymbolDic[1087] = "cloud.moon.bolt.fill"
        nightSymbolDic[1114] = "wind.snow"
        nightSymbolDic[1117] = "snowflake"
        nightSymbolDic[1135] = "cloud.fog.fill"
        nightSymbolDic[1147] = "cloud.fog.fill"
        nightSymbolDic[1150] = "cloud.drizzle.fill"
        nightSymbolDic[1153] = "cloud.drizzle.fill"
        nightSymbolDic[1168] = "cloud.drizzle.fill"
        nightSymbolDic[1171] = "cloud.drizzle.fill"
        nightSymbolDic[1180] = "cloud.moon.rain.fill"
        nightSymbolDic[1183] = "cloud.rain.fill"
        nightSymbolDic[1186] = "cloud.moon.rain.fill"
        nightSymbolDic[1189] = "cloud.rain.fill"
        nightSymbolDic[1192] = "cloud.moon.rain.fill"
        nightSymbolDic[1195] = "cloud.heavyrain.fill"
        nightSymbolDic[1198] = "cloud.rain.fill"
        nightSymbolDic[1201] = "cloud.heavyrain.fill"
        nightSymbolDic[1204] = "cloud.sleet.fill"
        nightSymbolDic[1207] = "cloud.sleet.fill"
        nightSymbolDic[1210] = "cloud.snow.fill"
        nightSymbolDic[1213] = "cloud.snow.fill"
        nightSymbolDic[1216] = "cloud.snow.fill"
        nightSymbolDic[1219] = "cloud.snow.fill"
        nightSymbolDic[1222] = "cloud.snow.fill"
        nightSymbolDic[1237] = "snowflake.circle.fill"
        nightSymbolDic[1240] = "cloud.moon.rain.fill"
        nightSymbolDic[1243] = "cloud.moon.rain.fill"
        nightSymbolDic[1246] = "cloud.moon.rain.fill"
        nightSymbolDic[1249] = "cloud.sleet.fill"
        nightSymbolDic[1252] = "cloud.sleet.fill"
        nightSymbolDic[1255] = "cloud.snow.fill"
        nightSymbolDic[1258] = "cloud.snow.fill"
        nightSymbolDic[1261] = "snowflake.circle.fill"
        nightSymbolDic[1264] = "snowflake.circle.fill"
        nightSymbolDic[1273] = "cloud.moon.bolt.fill"
        nightSymbolDic[1276] = "cloud.bolt.rain.fill"
        nightSymbolDic[1279] = "cloud.moon.bolt.fill"
        nightSymbolDic[1282] = "cloud.moon.bolt.fill"
    }
    
    private func setDefaultView(){
        locationLabel.text = "HELLO"
        tempLabel.text = "SUNSHINE"
        weatherLabel.text = "Check the Weather Now!"
        setWeatherImage(name: "sun.and.horizon")
        let background = UIImage(named: "background")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text ?? "")
        textField.endEditing(true)
        getWeather(search: textField.text)
        return true
    }
    
    @IBAction func onSearchTapped(_ sender: UIButton) {
        searchTextField.endEditing(true)
        getWeather(search:searchTextField.text?.lowercased())
    }
    
    private func getWeather(search:String?) {
        guard let search = search else{
            return
        }
        
        // Step 1: get the URL
        let url = getUrl(search:search)
        
        guard let url = url else{
            print("Could not get URL")
            return
        }
        
        // Step 2: Create URLSession
        let session = URLSession.shared
        
        // Step 3: Create task for session
        let dataTask = session.dataTask(with: url){ data, response,error in
            // network call finished
            print("network call complete")
            
            guard error == nil else{
                print("received error")
                return
            }
            
            guard let data = data else{
                print("No data found")
                return
            }
            
            if let weather = self.parseJson(data: data){
                print(weather.location.name)
                print(weather.current.temp_c)
                print(weather.current.condition.text)
                let localtime = weather.location.localtime.components(separatedBy: " ")
                let time = localtime[1]

                if(self.isDay(time:time)){
                    DispatchQueue.main.async{
                        self.setWeatherImage(name: self.daySymbolDic[weather.current.condition.code]!)
                    }
                }else{
                    DispatchQueue.main.async{
                        self.setWeatherImage(name: self.nightSymbolDic[weather.current.condition.code]!)
                    }
                }
 
                DispatchQueue.main.async {
                    self.locationLabel.text = weather.location.name
                    self.tempLabel.text = "\(weather.current.temp_c)C"
                    self.weatherLabel.text = weather.current.condition.text
                   
                }

            }
        }
        
        // Setp 4: Start the task
        dataTask.resume()
    }
    
    private func setWeatherImage(name:String){
        let config = UIImage.SymbolConfiguration(paletteColors:[.systemBlue,.systemYellow,.systemTeal])
        weatherImage.preferredSymbolConfiguration = config
        weatherImage.image = UIImage(systemName: name)
    }
    
    private func isDay(time:String) -> Bool{
        let timeList = time.components(separatedBy: ":")
        let hour = timeList[0]
        
        if (Int(hour)! >= 0 && Int(hour)! < 12 ){
            return true
        }
        
        return false;
    }
    
    private func getUrl(search:String) -> URL?{
        let baseUrl = "https://api.weatherapi.com/v1/"
        let currentEndpoint = "current.json"
        let apiKey = "1982b7197cc44490ace210340221603"
        
        let url = "\(baseUrl)\(currentEndpoint)?key=\(apiKey)&q=\(search)"
        
        return URL(string:url)
    }
    
    private func parseJson(data:Data)->WeatherResponse?{
        let decoder = JSONDecoder()
        var weatherResponse: WeatherResponse?

        do{
            weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
        }catch{
            print("Error parsing weather")
            print(error)
        }
        return weatherResponse
    }
    
    @IBAction func onLocateMeTapped(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // optional binding
        if let location = locations.last{
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            //print("\(latitude),\(longitude)")
            self.getWeather(search: "\(latitude),\(longitude)")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

struct WeatherResponse:Decodable{
    let location:Location
    let current:Weather
}

struct Location:Decodable{
    let name:String
    let localtime: String
}

struct Weather:Decodable{
    let temp_c: Float
    let condition: WeatherCondition
}

struct WeatherCondition: Decodable{
    let text:String
    let code:Int
}
