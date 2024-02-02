//
//  SearchBarView.swift
//  MyWeather
//
//  Created by Pablo Amador on 2/2/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var city: String
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        HStack {
            TextField("Enter location", text: $city)
        
                .cornerRadius(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .bold()
                .font(.subheadline)
            
        }
        .padding()
    }
}

#Preview {
    SearchBarView(city: .constant(""))
}
