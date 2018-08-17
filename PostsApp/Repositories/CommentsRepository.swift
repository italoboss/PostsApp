//
//  CommentsRepository.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

class CommentsRepository: Repository {
    
    func getAll(of postId: Int) -> [Comments] {
        // to do...
        return []
    }
    
    // MARK: - Repository Protocol functions
    
    func getAll() -> [Comments] {
        // to do...
        return []
    }
    
    func get(identifier: Int) -> Comments? {
        // to do...
        return nil
    }
    
    func create(a: Comments) -> Bool {
        // to do...
        return false
    }
    
    func update(a: Comments) -> Bool {
        // to do...
        return false
    }
    
    func delete(a: Comments) -> Bool {
        // to do...
        return false
    }
    
}
