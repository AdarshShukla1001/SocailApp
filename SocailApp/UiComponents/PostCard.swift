//
//  PostCard.swift
//  SocailApp
//
//  Created by adarsh shukla on 12/11/24.
//
import SwiftUI

struct PostCard: View {
    var post: PostModel
     
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                // Image with Gradient Overlay
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .frame(width: geometry.size.width - 40, height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.height - 40, height: 200)
                                .cornerRadius(15, corners: [.topLeft, .topRight])

                                .clipped()
                        case .failure:
                            Text("Failed to load image")
                                .foregroundColor(.red)
                                .frame(width: geometry.size.width - 40, height: 200)
                                .background(Color.gray)
                               .cornerRadius(15, corners: [.topLeft, .topRight])
                        @unknown default:
                            Text("Unknown error")
                                .frame(width: geometry.size.width - 40, height: 200)
                        }
                    }
                    
                    // Gradient overlay on top of image
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.4), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(height: 60)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                }
                .frame(height: 200)
                
                // User & Company Info
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                    
                    Text("\(post.userId)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("Company: ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 10)
                
                // Title and Description
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(post.body)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                // Action Buttons (Like & Comment)
                HStack {
                    Button(action: {
                        // Handle like action
                    }) {
                        HStack {
                            Image(systemName: "heart")
                                .foregroundColor(.red)
                            Text("Like")
                                .font(.subheadline)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle comment action
                    }) {
                        HStack {
                            Image(systemName: "bubble.right")
                                .foregroundColor(.blue)
                            Text("Comment")
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard(
            post: PostModel(id: 1, title: "Card Title", body: "This is a description of the item that will appear in the card.", userId: 1)
        )
    }
}
