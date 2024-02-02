//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by Pablo Amador on 15/5/23.


import Foundation



final class WeatherViewModel: ObservableObject {
    
    @Published var weatherResponse: ResponseDataModel?
    
    func fetchWeather(for city: String) async {
        guard let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid={your app id}&units=metric") else { return}
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: urlString)
            let dataFromModel = try await JSONDecoder().decode(ResponseDataModel.self, from: data)
            DispatchQueue.main.async {
                self.weatherResponse = dataFromModel
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}


