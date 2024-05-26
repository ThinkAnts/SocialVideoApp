//
//  FeedDetailsView.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import SwiftUI

struct FeedDetailsView: View {
  @StateObject private var viewModel = FeedListViewModel(restService: SocialVideoRestServices())
  
  var body: some View {
    NavigationStack {
      ScrollView {
        ForEach(0 ..< viewModel.feedCount, id: \.self) { feed in
          
          NavigationLink(destination: PostDetailsView(viewModel: PostFeedViewModel(restService: SocialVideoRestServices(), postId: viewModel.getPostId(index: feed)))) {
            FeedView(videoFeed: viewModel.getFeed(index: feed))
            Divider()
          }
        }
      }
      .refreshable {
        await viewModel.getFeedList()
      }
      .navigationTitle("Feed")
      .navigationBarTitleDisplayMode(.large)
    } .task {
      await viewModel.getFeedList()
    }
  }
}

#Preview {
    FeedDetailsView()
}
