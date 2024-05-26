//
//  RestServices.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

protocol RestServices {
  func getFeedDetails(path: String) async throws -> SocialFeedDetails
  func getPostDetails(path: String) async throws -> PostFeed
  func getUserDetails(path: String) async throws -> UserAccount
}
