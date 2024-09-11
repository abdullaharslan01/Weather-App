//
//  WeatherButton.swift
//  Weather-App
//
//  Created by abdullah on 11.09.2024.
//

import SwiftUI

struct WeatherButton: View {
    
    let title: String
    let textColor: Color
    let backgroundColor:Color
    
    
    var body: some View {
        Text("\(title)")
            .foregroundStyle(textColor)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

