//
//  UserDetailsViewModel.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

final class UserDetailsViewModel: ObservableObject {
  
  private let restService: RestServices
  private var userName: String
  @Published var userAccount: UserAccount?
  
  init(restService: RestServices, userName: String) {
    self.restService = restService
    self.userName = userName
  }
  
  @MainActor
  func getUserDetails() async {
    let urlString = SocialVideoPaths.userDetailsPath.pathDetails + "/" + self.userName
    do {
      userAccount = try await restService.getUserDetails(path: urlString)
    } catch {
       print("Unable to fetch User Feed")
    }
  }
  
  var profileUrl: String {
    if let profileUrl = userAccount?.data.profilePictureUrl {
      return profileUrl
    }
    return "https://storage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg"
  }
  
  var profileUserName: String {
    if let userName = userAccount?.data.username {
      return userName
    }
    return ""
  }
  
  var postsCount: Int {
    if let count = userAccount?.data.posts.count {
      return count
    }
   return 0
  }
  
  func getPostThumbNailUrl(_ index: Int) -> String {
    if let thumbNailUrl = userAccount?.data.posts[index].thumbnail_url {
       return thumbNailUrl
    }
    return "https://storage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg"
  }
}
