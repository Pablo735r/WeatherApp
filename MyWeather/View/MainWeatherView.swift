//
//  MainWeatherView.swift
//  MyWeather
//
//  Created by Pablo Amador on 21/4/23.
//

import SwiftUI
import CoreLocation

struct MainWeatherView: View {
    

    @StateObject var weatherViewModel = WeatherViewModel()
    @State var city = ""
   
  
    var body: some View {
        
        ZStack {
            BackgroundStyleView(topColor: .blue, bottomColor: .green)
                    .ignoresSafeArea(.all)
            
            
            VStack (spacing: -20) {
                HStack {

                SearchBarView(city: $city)
                    
                    
                    Button(action: {
                        
                        Task {
                            await weatherViewModel.fetchWeather(for: city)
                    }
                        
                    },label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    })
                    
                }
                .padding()
                
                HStack {
                    Spacer()

                
                        Text(weatherViewModel.weatherResponse?.city ?? "No city")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .padding(.top, 30)
                            .padding()
                    
                }
  
                
                HStack(spacing: -20) {
                    
                    Spacer()
                    
                    if let iconURL = weatherViewModel.weatherResponse?.weather.first?.iconUrlString,
                       let url = URL(string: "https://openweathermap.org/img/wn/\(iconURL)@2x.png"){
                        
                        AsyncImage(url: url){ image in
                            image
                    
                            .font(.system(size: 30))
                            .padding(.top, 30)
                
                        } placeholder: {
                            
                            Image(systemName: "photo.circle.fill")
                                .iconModifier()
                                .padding(.top, 40)
                                .padding()
                               
                        }
                        
                    }
                    
                    HStack {
                   
                        Text("\(Int(weatherViewModel.weatherResponse?.temperature.currentTemperature ?? 0.0)) °C")
                            
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .padding(.top, 30)
                            .padding()
                        
                    }
           
                }
                
                HStack{
                    Spacer()
                    Text(weatherViewModel.weatherResponse?.weather.first?.description ?? "No description")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                        .padding()
                }
                
                Spacer()
            }
            
        }
        
    }
}


struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}

extension Image {
    func imageModifier() -> some View {
        self .resizable()
            .scaledToFit()
    }
  
    func iconModifier() -> some View {
        self
            .imageModifier() 
            .frame(maxWidth: 60)
            .foregroundColor(.purple)
            .opacity(0.5)
        
    }
}
