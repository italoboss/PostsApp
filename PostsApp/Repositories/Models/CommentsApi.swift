//
//  CommentsApi.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import Foundation

class CommentsApi {
    
    let commentUrl = Config.baseURL.appendingPathComponent("comments")
    
    func fetchAll(of post: PostsDto, completion: @escaping ([CommentsDto]) -> Void) {
        
        let urlComponents = NSURLComponents(url: commentUrl!, resolvingAgainstBaseURL: false)
        urlComponents?.query = "postId=\(post.id)"
        
        guard let endpoint = urlComponents?.url
            else {
                return
        }
        print(endpoint)
        let task = URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            
            if let urlContent = data {
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    if let result = jsonResult as? [[String: Any]] {
                        var comments: [CommentsDto] = []
                        for obj in result {
                            
                            if let comment = self.createCommentsInstance(with: obj) {
                                comments.append(comment)
                            }
                            
                        }
                        DispatchQueue.main.async {
                            completion(comments)
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
    
    func createCommentsInstance(with obj: [String: Any]) -> CommentsDto? {
        if let name = obj["name"] as? String,
            let body = obj["body"] as? String
        {
            let comment = CommentsDto(name: name, body: body)
            return comment
        }
        else {
            return nil
        }
    }
    
}
