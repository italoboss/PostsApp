//
//  Repository.swift
//  PostsApp
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

protocol Repository {
    associatedtype T
    
    func getAll() -> [T]
    func get( identifier:Int ) -> T?
    func create( a:T ) -> Bool
    func update( a:T ) -> Bool
    func delete( a:T ) -> Bool
}
