//
//  ViewController.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let postRepository = PostsRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didSyncApi(_ sender: Any) {
        postRepository.syncApi()
    }

    @IBAction func printObjects(_ sender: Any) {
        let all = postRepository.getAll()
        print(all.count)
        for post in all {
            print(post.comments?.count ?? "_")
        }
        
        let comments = CommentsDao().fetchAll(of: 0)
        print(comments.count)
    }
    
}

