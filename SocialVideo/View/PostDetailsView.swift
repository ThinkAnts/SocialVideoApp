//
//  PostDetailsView.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import SwiftUI
import AVKit

struct PostDetailsView: View {
  @StateObject var viewModel: PostFeedViewModel
    var body: some View {
      VStack {
        VideoPlayer(player: AVPlayer(url: viewModel.postVideoUrl))
          .frame(height: 200)
        HStack() {
          NavigationLink(destination: UserAccountView(viewModel: UserDetailsViewModel(restService: SocialVideoRestServices(), userName: viewModel.userName))) {
            HStack() {
              
              Image(systemName: "person.circle")
                                      .resizable()
                                      .frame(width: 20, height: 20)
              Text(viewModel.userName)
            }
          }
          Spacer()

          Text("PostId:" + String(viewModel.postFeedDetails?.data.postId ?? 0))
          
          Spacer()
          
          HStack() {
            Image(systemName: "hand.thumbsup.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
            Text("Likes:" + String(viewModel.postFeedDetails?.data.likes ?? 0))
          }
          
        }
        Spacer()
      } .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.large)
      .padding(.all)
        .task {
          await viewModel.getPostFeed()
        }
    }
}

#Preview {
  PostDetailsView(viewModel: PostFeedViewModel(restService: SocialVideoRestServices(),
                                               postId: 1))
}
