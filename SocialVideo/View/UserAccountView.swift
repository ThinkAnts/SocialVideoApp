//
//  UserAccountView.swift
//  SocialVideo
//
//  Created by Ravi Kishore on 26/05/24.
//

import SwiftUI

struct UserAccountView: View {
  @StateObject var viewModel: UserDetailsViewModel
  var body: some View {
    VStack {
      profileView
      Spacer()
      postsView
    }.padding(.all)
      .navigationTitle("Profile")
      .navigationBarTitleDisplayMode(.large)
      .task {
        await viewModel.getUserDetails()
      }
  }
  
  var profileView: some View {
    VStack(alignment: .center) {
      AsyncImage(url: URL(string: viewModel.profileUrl)) { image in
          image.resizable()
      } placeholder: {
        Color.gray
      }
      .frame(width: 128, height: 128)
      .clipShape(.rect(cornerRadius: 25))
      Text(viewModel.profileUserName)
        .font(.subheadline)
    }
  }
  
  var postsView: some View {
    VStack(alignment: .leading) {
      Text("Posts")
        .font(.headline)
      
      ScrollView {
        ForEach(0 ..< viewModel.postsCount, id: \.self) { i in
          VStack(alignment: .leading) {
            HStack {
              AsyncImage(url: URL(string: viewModel.getPostThumbNailUrl(i))) { image in
                  image.resizable()
              } placeholder: {
                Color.gray
              }
              .frame(width: 40, height: 40)
              .clipShape(.rect(cornerRadius: 25))
              
              VStack(alignment: .leading) {
                Text("PostId:" + String(viewModel.userAccount?.data.posts[i].postId ?? 0))
                Text("Likes:" + String(viewModel.userAccount?.data.posts[i].likes ?? 0))
              }
              Spacer()
            }
          }
            Divider()
        }
      }
    }
  }
}

#Preview {
  UserAccountView(viewModel: UserDetailsViewModel(restService: SocialVideoRestServices(), userName: "John Doe"))
}
