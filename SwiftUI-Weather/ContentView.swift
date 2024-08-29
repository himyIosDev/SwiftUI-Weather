//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Hamza Mughal on 23/08/2024.
//

import SwiftUI

struct ContentView: View {
    //
    @State private var isNight = false
    
    var body: some View {
        //
        ZStack {
            //
            BackgroundView(isNight: isNight)
            
            VStack {
                //
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                // weather with days
                HStack(spacing: 20) {
                    //
                    WeatherDaysView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDaysView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeatherDaysView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                    WeatherDaysView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    WeatherDaysView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
                }
                
                Spacer()
                
                Button {
                    // button action
                    isNight.toggle()
                    
                } label: {
                    //
                    WeatherButton(title : "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

// MARK: - Extracted Views -

struct BackgroundView: View {
    //
    var isNight : Bool
    
    var body: some View {
        //
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

// ***************************************************************************

struct CityTextView : View {
    //
    var cityName : String
    
    var body: some View {
        //
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

// ***************************************************************************

struct MainWeatherStatusView : View {
    //
    var imageName : String
    var temperature : Int
    
    var body: some View {
        //
        VStack(spacing: 10) {
            //
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

// ***************************************************************************

struct WeatherDaysView: View {
    //
    var dayOfWeek : String
    var imageName : String
    var temperature: Int
    
    var body: some View {
        //
        VStack {
            //
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


 
