//
//  UrlSessionApiService.swift
//  URLSessionServiceCode
//
//  Created by Efekan Güvendik on 28.09.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRequest<T: Decodable>(from url: URL, completion: @escaping (T?, Error?) -> Void)
}

class UrlSessionApiService: NetworkServiceProtocol {
    
    static let shared = UrlSessionApiService()
    
    init() { }

    func getRequest<T: Decodable>(from url: URL, completion: @escaping (T?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, NSError(domain: "NetworkError", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData, nil)
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
            }
        }.resume()
    }
}
