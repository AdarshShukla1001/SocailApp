//
//  HomeView.swift
//  SocailApp
//
//  Created by adarsh shukla on 12/11/24.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...") // Display loading indicator
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage) // Show error message
                        .foregroundColor(.red)
                        .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.posts) { post in
                                NavigationLink(destination: PostDetailView(post: post)) {
                                    PostCard(post: post)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.top, 10)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Home")
            .onAppear {
                viewModel.fetchPosts() // Fetch posts when view appears
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
