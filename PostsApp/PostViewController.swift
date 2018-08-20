//
//  PostViewController.swift
//  PostsApp
//
//  Created by Ada 2018 on 20/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    
    var post: Posts?
    var comments: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        commentsTableView.dataSource = self

        if let post = self.post {
            titleLabel.text = post.title
            bodyLabel.text = post.body
            
            print(post.comments?.count ?? "-")
            
            guard let comments = post.comments else { return }
            for setComment in comments {
                if let comment = setComment as? Comments {
                    print(comment)
                    self.comments.append(comment)
                }
            }
        }
        
    }

}

extension PostViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") else { return UITableViewCell() }
        
        let comment = self.comments[indexPath.row]
        cell.textLabel?.text = comment.name
        return cell
    }
    
    
    
}
