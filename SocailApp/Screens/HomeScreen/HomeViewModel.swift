//
//  HomeViewModel.swift
//  SocailApp
//
//  Created by adarsh shukla on 14/11/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    func fetchPosts() {
        isLoading = true
        errorMessage = nil
        
        NetworkService.shared.fetchPosts { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure(let error):
                    self?.errorMessage = "Failed to load posts: \(error.localizedDescription)"
                }
            }
        }
    }
}
