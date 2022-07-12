//
//  ToDoService.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

protocol ToDoServiceProtocol {
    func getProperties(
        completion: @escaping (Result<QuerySnapshot?, Error>) -> Void)
    
    func createToDoItem(
        toDoItem: ToDoItem,
        image: UIImage,
        completion: @escaping (Result<Void, Error>) -> Void)
    
    func uploadImage(
        image: UIImage,
        completion: @escaping (Result<String, Error>) -> Void)
    
    func searchProperties(
        keyword: String,
        completion: @escaping (Result<QuerySnapshot?, Error>) -> Void)
}

class ToDoService: ToDoServiceProtocol {
    func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
    }
    
    func getProperties(completion: @escaping (Result<QuerySnapshot?, Error>) -> Void) {
        
    }
    
    func createToDoItem(toDoItem: ToDoItem, image: UIImage, completion: @escaping (Result<Void, Error>) -> Void) {
        
    }
    
    func searchProperties(keyword: String, completion: @escaping (Result<QuerySnapshot?, Error>) -> Void) {
        
    }
    
}
