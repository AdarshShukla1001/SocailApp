//
//  PostModel.swift
//  SocailApp
//
//  Created by adarsh shukla on 12/11/24.
//

struct PostModel: Identifiable,Codable {
    var id: Int
    var title: String
    var body: String
    var userId: Int
 }
