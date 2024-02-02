//
//  BackgroundStyleView.swift
//  MyWeather
//
//  Created by Pablo Amador on 21/4/23.
//

import SwiftUI

struct BackgroundStyleView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if colorScheme == .light {
                LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                    
            }
        }
        
    }
}

#Preview {
    BackgroundStyleView(topColor: Color.orange, bottomColor: Color.red)
}
