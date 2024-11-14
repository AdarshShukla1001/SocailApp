//
//  NetworkService.swift
//  SocailApp
//
//  Created by adarsh shukla on 13/11/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}

    func fetchPosts(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
