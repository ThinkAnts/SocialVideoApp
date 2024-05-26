//
//  UserDetails.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

struct UserAccount: Codable {
  let status: String
  let data: UserDetails
}

struct UserDetails: Codable {
  let username: String
  let profilePictureUrl: String
  let posts: [PostDetails]
}

struct Post: Codable {
  let postId: Int
  let videoUrl: String
  let thumbnail_url: String
  let likes: Int
}
