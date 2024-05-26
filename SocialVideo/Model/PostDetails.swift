//
//  PostDetails.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

struct PostFeed: Codable {
  let status: String
  let data: PostDetails
}

struct PostDetails: Codable {
  let postId: Int
  let videoUrl: String
  let thumbnail_url: String
  let username: String?
  let likes: Int
}
