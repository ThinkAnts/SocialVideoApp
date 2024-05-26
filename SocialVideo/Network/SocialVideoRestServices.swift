//
//  SocialVideoRestServices.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

class SocialVideoRestServices: RestServices {
  
  func getFeedDetails(path: String) async throws -> SocialFeedDetails {
    let endPoint = Endpoint(path: path)
    return try await NetworkManager().get(from: endPoint)
  }
  
  func getPostDetails(path: String) async throws -> PostFeed {
    let endPoint = Endpoint(path: path)
    return try await NetworkManager().get(from: endPoint)
  }
  
  func getUserDetails(path: String) async throws -> UserAccount {
    let endPoint = Endpoint(path: path)
    return try await NetworkManager().get(from: endPoint)
  }
}
