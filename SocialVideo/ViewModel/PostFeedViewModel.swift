//
//  PostFeedViewModel.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

final class PostFeedViewModel: ObservableObject {
  private let restService: RestServices
  @Published var postFeedDetails: PostFeed?
  private var postId: String
  
  
  init(restService: RestServices, postId: Int) {
    self.restService = restService
    self.postId = String(postId)
  }
  
  @MainActor
  func getPostFeed() async {
    let urlString = SocialVideoPaths.postFeedPath.pathDetails + "/" + self.postId
    do {
      postFeedDetails = try await restService.getPostDetails(path: urlString)
    } catch {
       print("Unable to fetch POST Feed")
    }
  }
  
  var postVideoUrl: URL {
    if let videoUrl = postFeedDetails?.data.videoUrl {
      return URL(string: videoUrl)!
    }
    return URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!
  }
  
  var userName: String {
    if let uername = postFeedDetails?.data.username {
      return uername
    }
    return ""
  }
  
  var thumbNailUrl: String {
    if let url = postFeedDetails?.data.thumbnail_url {
      return url
    }
    return ""
  }
}
