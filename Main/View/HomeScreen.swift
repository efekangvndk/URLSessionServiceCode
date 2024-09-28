//
//  ContentView.swift
//  URLSessionServiceCode
//
//  Created by Efekan Güvendik on 28.09.2024.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = HomeScreenViewModel(networkService: NetworkCallRequest())

    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text("Hata: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if let weather = viewModel.weatherResults {
                Text("Hava Durumu: \(weather.current.weatherDescriptions.first ?? "")")
                Text("Sıcaklık: \(weather.current.temperature)°C")
                Text("Rüzgar Hızı: \(weather.current.windSpeed) km/h")
            } else {
                Text("Veriler yükleniyor...")
            }
        }
        .padding()
    }
}

#Preview {
    HomeScreenView()
}
