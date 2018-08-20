//
//  PostsAPI.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//
import Foundation

class PostsApi {
    
    let postUrl = Config.baseURL.appendingPathComponent("posts")
    
    // Consume an endpoint to get all the Posts
    func fetchAll(completion: @escaping ([PostsDto]) -> Void) {
        
        let task = URLSession.shared.dataTask(with: postUrl!) { (data, response, error) in
            
            if let urlContent = data {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    if let result = jsonResult as? [[String: Any]] {
                        var posts: [PostsDto] = []
                        for obj in result {

                            if let post = self.createPostsInstance(with: obj) {
                                posts.append(post)
                            }
                            
                        }
                        DispatchQueue.main.async {
                            completion(posts)
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
            
        }
        task.resume()
    }
    
    // Transform dictionary to a Post Object
    func createPostsInstance(with obj: [String: Any]) -> PostsDto? {
        if let id = obj["id"] as? Int64,
            let title = obj["title"] as? String,
            let body = obj["body"] as? String
        {
            let post = PostsDto(id: id, title: title, body: body)
            return post
        }
        else {
            return nil
        }
    }
    
}
