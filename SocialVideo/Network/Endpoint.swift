//
//  Endpoint.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import Foundation

struct Endpoint {
  let host = "d8aa7587-2093-446c-929e-eb7e5815df81.mock.pstmn.io"
  let path: String
}

extension Endpoint {
  var url: URL? {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = host
    urlComponents.path = path
    return urlComponents.url
  }
}


enum SocialVideoPaths: String {
  case feedPath
  case userDetailsPath
  case postFeedPath
  
  var pathDetails: String {
    switch self {
    case .feedPath: return "/api/feed"
    case .userDetailsPath: return "/api/profile"
    case .postFeedPath: return "/api/post"
    }
  }
}
