//
//  NetworkCallRequest.swift
//  URLSessionServiceCode
//
//  Created by Efekan Güvendik on 28.09.2024.
//

import Foundation

class NetworkCallRequest{
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = UrlSessionApiService()) {
        self.networkService = networkService
    }
    
    func leadData(completion: @escaping (WeatherResponse?, Error?) -> Void) {

        guard let url = URL(string: "\(WeatherServiceApiConstant.weatherUrl)?access_key=\(WeatherServiceApiConstant.apiKey)&query=\(WeatherServiceApiConstant.City)") else {
            completion(nil, NSError(domain: "InvalidURL", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }

        networkService.getRequest(from: url) { (response: WeatherResponse?, error) in
            completion(response, error)
        }
    }
}
