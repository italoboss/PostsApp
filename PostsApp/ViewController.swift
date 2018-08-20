//
//  ViewController.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    
    let postRepository = PostsRepository()
    var posts: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        postsTableView.delegate = self
        postsTableView.dataSource = self
        
        posts = postRepository.getAll()
    }

    @IBAction func didSyncApi(_ sender: Any) {
        postRepository.syncApi()
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetail" {
            
            if let postVC = segue.destination as? PostViewController, let post = sender as? Posts {
                postVC.post = post
            }
            
        }
     }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        performSegue(withIdentifier: "toPostDetail", sender: post)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") else { return UITableViewCell() }
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}
