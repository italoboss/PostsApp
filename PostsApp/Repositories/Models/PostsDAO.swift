//
//  PostsDAO.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import CoreData

class PostsDao {
    
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    
    func fetchAll() -> [Posts] {
        let request: NSFetchRequest<Posts> = Posts.fetchRequest()
        do {
            let result = try context.fetch(request)
            return result
        }
        catch {
            print(error)
        }
        return []
    }
    
    func clearAllPosts() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Posts")
        let delete = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try CoreDataManager.sharedManager.persistentContainer.viewContext.execute(delete)
        }
        catch {
            print(error)
        }
    }
    
}
