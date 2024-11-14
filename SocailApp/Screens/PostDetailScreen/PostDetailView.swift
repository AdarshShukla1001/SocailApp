//
//  PostDetailView.swift
//  SocailApp
//
//  Created by adarsh shukla on 12/11/24.
//
import SwiftUI


struct PostDetailView: View {
    var post: PostModel
 
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                // Post Image
                AsyncImage(url: URL(string:"https://picsum.photos/200")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .frame(width: 100, height: 100)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                             
                            .cornerRadius(15, corners: [.topLeft, .topRight])
                            .clipped()
                            .shadow(radius: 5)
                    case .failure:
                        Text("Failed to load image")
                            .foregroundColor(.red)
                    @unknown default:
                        Text("Unknown error")
                    }
                }
                
                // Post Title and Body
                Text(post.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)
                
                Text(post.body)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                
                // User Details
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    Text("User: \(post.userId)")  // User's name
                    //                    Spacer()
                    Text("Company:  ")  // User's company
                }
                .padding(.bottom, 15)
                
                // Comments Section
                                Text("Comments")
                                    .font(.headline)
                                    .padding(.bottom, 5)
                                
//                                ForEach(comments, id: \.id) { comment in
//                                    VStack(alignment: .leading) {
//                                        Text(comment.name)
//                                            .font(.subheadline)
//                                            .fontWeight(.bold)
//                                            .foregroundColor(.primary)
//                                        
//                                        Text(comment.body)
//                                            .font(.body)
//                                            .foregroundColor(.secondary)
//                                            .padding(.bottom, 10)
//                                    }
//                                    .padding(.bottom, 15)
//                                }
//                            }
//                            .padding(.horizontal, 10)
            }
            .navigationTitle(post.title)  // Set navigation title to post title
            .navigationBarBackButtonHidden(false)  // Ensure back button is shown
            // Set navigation title to post title
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
    
        PostDetailView(
            post: PostModel(id: 1, title: "Card Title", body: "This is a description of the item that will appear in the card.",   userId: 1 )
            
        )
    }
}
