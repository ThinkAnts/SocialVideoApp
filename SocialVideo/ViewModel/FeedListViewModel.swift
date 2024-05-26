//
//  FeedListViewModel.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

final class FeedListViewModel: ObservableObject {
  
  private let restService: RestServices
  private var feedDetails: SocialFeedDetails?
  @Published var feedList: [SocialVideoFeed]?
  
  init(restService: RestServices) {
    self.restService = restService
  }
  
  @MainActor
  func getFeedList() async {
    do {
      feedDetails = try await restService.getFeedDetails(path: SocialVideoPaths.feedPath.pathDetails)
      if let feed = feedDetails {
        feedList = feed.data
      } else {
        print("Feed details is Empty")
      }
    } catch {
       print("Unable to fetch Feed details")
    }
  }
  
  var feedCount: Int {
    if let feedCount = feedList?.count {
      return feedCount
    }
    return 0
  }
  
  func getFeed(index: Int) -> SocialVideoFeed {
    if let videoFeed = feedList?[index] {
        return videoFeed
    }
    
    return SocialVideoFeed(postId: 1,
                           videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                           thumbnail_url: "https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg", username: "user123", likes: 4)
  }
  
  func getPostId(index: Int) -> Int {
    if let videoFeed = feedList?[index] {
      return videoFeed.postId
    }
    return 0
  }
}
