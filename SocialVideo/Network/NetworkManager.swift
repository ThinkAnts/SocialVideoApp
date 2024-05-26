//
//  NetworkManager.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

struct NetworkManager {
  
  func get<T:Codable>(from endPoint: Endpoint) async throws -> T {
    let headers = ["accept": "application/json"]
    guard let url = endPoint.url else
    { throw  ApiError.invalidUrl }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let (data, response) =  try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse else {
      throw ApiError.requestFailed(description: "Invalid response")
    }
    
    guard  httpResponse.statusCode == 200 else {
      throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
    }
    
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      throw ApiError.jsonConversionFailure(description: error.localizedDescription)
    }
  }
}
