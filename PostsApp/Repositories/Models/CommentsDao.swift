//
//  CommentsDao.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import CoreData

class CommentsDao {
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func fetchAll() -> [Comments] {
        let request: NSFetchRequest<Comments> = Comments.fetchRequest()
        do {
            let result = try context.fetch(request)
            return result
        }
        catch {
            print(error)
        }
        return []
    }
    
    func fetchAll(of postId: Int) -> [Comments] {
        let request: NSFetchRequest<Comments> = Comments.fetchRequest()
        request.predicate = NSPredicate(format: "post.id == \(postId)")
        do {
            let result = try context.fetch(request)
            return result
        }
        catch {
            print(error)
        }
        return []
    }
    
    func clearAllComments() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Comments")
        let delete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try CoreDataManager.sharedManager.persistentContainer.viewContext.execute(delete)
        }
        catch {
            print(error)
        }
    }
    
}
