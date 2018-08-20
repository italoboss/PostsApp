//
//  PostsRepository.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//
import CoreData

class PostsRepository: Repository {
    
    func getAll() -> [Posts] {
        // Aqui seria ideal que fosse verificado de onde serão carregados
        // os dados, Local ou Web, e então retornado o mesmo.
        return PostsDao().fetchAll()
    }
    
    func get(identifier: Int) -> Posts? {
        // to do...
        return nil
    }
    
    func create(a: Posts) -> Bool {
        // to do...
        return false
    }
    
    func update(a: Posts) -> Bool {
        // to do...
        return false
    }
    
    func delete(a: Posts) -> Bool {
        // to do...
        return false
    }
    
    // Function to consume an API to get Posts and their Comments and save locally the first 10 Posts
    func syncApi() {
        PostsApi().fetchAll { (posts) in
            
            PostsDao().clearAllPosts()
            CommentsDao().clearAllComments()
            
            var somePosts: [PostsDto] = []
            if posts.count > 10 {
                for i in 0...9 {
                    somePosts.append(posts[i])
                }
            }
            else {
                somePosts = posts
            }
            
            for post in somePosts {
                let managedPost = NSEntityDescription.insertNewObject(forEntityName: "Posts", into: CoreDataManager.sharedManager.persistentContainer.viewContext) as! Posts
                managedPost.id = post.id
                managedPost.title = post.title
                managedPost.body = post.body
                
                CommentsApi().fetchAll(of: post, completion: { (comments) in
                    for comment in comments {
                        let managedComment = NSEntityDescription.insertNewObject(forEntityName: "Comments", into: CoreDataManager.sharedManager.persistentContainer.viewContext) as! Comments
                        managedComment.name = comment.name
                        managedComment.body = comment.body
                        managedComment.post = managedPost
                        CoreDataManager.sharedManager.saveContext()
                    }
                })
            }
            print(" Posts Api finalized")
            CoreDataManager.sharedManager.saveContext()
        }
    }
    
}
