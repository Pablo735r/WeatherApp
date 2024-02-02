//
//  WeatherResponseDataModel.swift
//  MyWeather
//
//  Created by Pablo Amador on 19/5/23.
//

import Foundation

struct ResponseDataModel: Decodable{
    
    let city: String
    let weather: [WeatherDataModel]
    let temperature: TemperatureModel
    
    enum CodingKeys: String,CodingKey{
        
        case city = "name"
        case weather
        case temperature = "main"
        
    }
    
}


struct WeatherDataModel: Decodable{
    let main: String
    let description: String
    let iconUrlString: String
    
    enum CodingKeys: String,CodingKey{
        
        case main
        case description
        case iconUrlString  = "icon"
        
    }
    
}

struct TemperatureModel:  Decodable {
    let currentTemperature: Double
    
    enum CodingKeys: String,CodingKey{
        
        case currentTemperature = "temp"
    }
    
}
