//
//  Posts.swift
//  PostsApp
//
//  Created by Ada 2018 on 20/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

class PostsDto {
    
    var id: Int64
    var title: String
    var body: String
    
    init(id: Int64, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
    
}
