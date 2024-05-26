//
//  FeedView.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
  var videoFeed: SocialVideoFeed
  var body: some View {
    VStack(alignment: .leading) {
      HStack{
        Image(systemName: "person.circle")
          .resizable()
          .frame(width: 20, height: 20)
        Text(videoFeed.username)
      }
      VideoPlayer(player: AVPlayer(url: URL(string: videoFeed.videoUrl)!), videoOverlay: {
        AsyncImage(url: URL(string: videoFeed.thumbnail_url)) { image in
          image.resizable()
        } placeholder: {
          Color.gray
        }
        .frame(height: 200)
      })
        .frame(height: 200)
      HStack() {
        Image(systemName: "hand.thumbsup.circle")
          .resizable()
          .frame(width: 20, height: 20)
        Text("Likes:" + String(videoFeed.likes))
      }
    }.padding(.all)
  }
}

#Preview {
  FeedView(videoFeed: SocialVideoFeed(postId: 1,
                                      videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                                      thumbnail_url: "https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg", username: "user123", likes: 4))
}
