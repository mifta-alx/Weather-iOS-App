//
//  ContentView.swift
//  Weather
//
//  Created by Alx on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather:ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView().task {
                        do{
                           weather = try await weatherManager.getCurrentWearther(latitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.717, saturation: 0.988, brightness: 0.206))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
