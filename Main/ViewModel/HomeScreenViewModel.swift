//
//  HomeScreenViewModel.swift
//  URLSessionServiceCode
//
//  Created by Efekan Güvendik on 28.09.2024.
//

import SwiftUI

class HomeScreenViewModel: ObservableObject {
    
    private var networkService: NetworkCallRequest

    @Published var weatherResults: WeatherResponse?
    @Published var errorMessage: String?

    init(networkService: NetworkCallRequest) {
        self.networkService = networkService
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        networkService.leadData { [weak self] weatherResponse, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    print("Hata: \(error)")
                } else {
                    self?.weatherResults = weatherResponse
                }
            }
        }
    }
}
