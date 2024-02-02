//
//  WeatherViewModel.swift
//  MyWeather
//
//  Created by Pablo Amador on 15/5/23.


import Foundation



final class WeatherViewModel: ObservableObject {
    
    @Published var weatherResponse: ResponseDataModel?
    
    func fetchWeather(for city: String) async {
        guard let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b7b264c37801f12d44cc68ef438b7482&units=metric") else { return}
        
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


