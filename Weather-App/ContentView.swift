//
//  ContentView.swift
//  Weather-App
//
//  Created by abdullah on 11.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    
    var body: some View {
        ZStack {
            
          BackgrooundView(isNight: isNight)
            
            VStack {
                
               CityTextView(cityName: "Gaziantep, TR")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 38)
                .padding(.bottom, 40)
                
                DayWeatherStatusView(forecastData: forecastData)
                
                Spacer()
                
                Button {
                    
                    isNight.toggle()
                    
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: isNight ? .white : .blue,
                        backgroundColor: isNight ? .gray : .white)
                }

                Spacer()
            }
        }
    }
    
    // Rastgele veriler oluşturuluyor
    let forecastData: [ForeCastData] = [
        ForeCastData("Mon", "cloud.sun.fill", 30),
        ForeCastData("Tue", "cloud.fill", 25),
        ForeCastData("Wed", "sun.max.fill", 28),
        ForeCastData("Thu", "cloud.rain.fill", 22),
        ForeCastData("Fri", "cloud.sun.fill", 27)
    ]
}

struct ForeCastData {
    let day: String
    let symbolName: String
    var degree: Int
    
    init(_ day: String, _ symbolName: String, _ degree: Int) {
        self.day = day
        self.symbolName = symbolName
        self.degree = degree
    }
}


#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    let day: String
    let symbolName: String
    let degree: Int
    
    var body: some View {
        VStack {
            Text("\(day)")
                .font(.system(size: 16, weight: .medium, design: .monospaced))
                .foregroundStyle(.white)
            
            Image(systemName: "\(symbolName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(degree)°")
                .font(.system(size: 28, weight: .bold, design: .monospaced))
                .foregroundStyle(.white)
        }
    }
}

struct BackgrooundView: View {
    
    
     var isNight: Bool

    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text("\(cityName)")
            .font(.system(size: 32, weight: .medium, design: .monospaced))
            .foregroundStyle(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .monospaced))
                .foregroundStyle(.white)
        }
    }
}

struct DayWeatherStatusView: View {
    
    var forecastData: [ForeCastData]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(forecastData, id: \.day) { data in
                WeatherDayView(day: data.day, symbolName: data.symbolName, degree: data.degree)
            }
        }
    }
}

