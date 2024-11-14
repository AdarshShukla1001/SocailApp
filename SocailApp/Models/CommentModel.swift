//
//  CommentModel.swift
//  SocailApp
//
//  Created by adarsh shukla on 12/11/24.
//

import Foundation

// Define the CommentModel
struct CommentModel: Identifiable, Codable {
    var id: Int
    var name: String
    var body: String
}

