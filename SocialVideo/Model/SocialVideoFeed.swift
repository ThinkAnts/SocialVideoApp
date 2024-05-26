//
//  SocialVideoFeed.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

struct SocialFeedDetails: Codable {
  let status: String
  let data: [SocialVideoFeed]
}


struct SocialVideoFeed: Codable {
  let postId: Int
  let videoUrl: String
  let thumbnail_url: String
  let username: String
  let likes: Int
}
