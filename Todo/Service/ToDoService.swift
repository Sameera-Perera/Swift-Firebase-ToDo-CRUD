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
    func getToDo(
        completion: @escaping (Result<QuerySnapshot?, Error>) -> Void)
    
    func createToDoItem(
        title: String,
        description: String,
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
    func createToDoItem(title: String, description: String, image: UIImage, completion: @escaping (Result<Void, Error>) -> Void) {
        let db = Firestore.firestore()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var urlString: String?
        let dGroup = DispatchGroup()
        
        dGroup.enter()
                if let imageDate = image.jpegData(compressionQuality: 0.8){
                    let metadata = StorageMetadata()
                    metadata.contentType = "image/jpg"
                    let imageName = UUID().uuidString
                    let imageRef = Storage.storage().reference().child(imageName)
                    imageRef.putData(imageDate, metadata: metadata) { (data, err) in
                        if err != nil {return}
                        imageRef.downloadURL { url, err in
                            if err != nil {return}
                            guard let url = url else {return}
                            urlString = url.absoluteString
                            print(urlString ?? "url String")
                            dGroup.leave()
                        }
                    }
                } else {
                    return
                }
        
        dGroup.notify(queue: .main) {
                    let propertyData: [String: Any] = [
                        "title": title,
                        "description": description,
                        "image": urlString ?? "",
                        "is_completed": false
                    ]
            db.collection("user").document(uid).collection("todo").document().setData(propertyData) { err in
                        if let err = err {
                            print(err.localizedDescription)
                            completion(.failure(err))
                        } else {
                            completion(.success(()))
                        }
                    }
                }
    }
    
    func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        if let imageDate = image.jpegData(compressionQuality: 0.8){
                    let metadata = StorageMetadata()
                    metadata.contentType = "image/jpg"
                    let imageName = UUID().uuidString
                    let imageRef = Storage.storage().reference().child(imageName)
                    var urlString: String?
                    imageRef.putData(imageDate, metadata: metadata) { (data, err) in
                        if err != nil {return}
                        imageRef.downloadURL { url, err in
                            if err != nil {return}
                            guard let url = url else {return}
                            urlString = url.absoluteString
                            print(urlString ?? "url String")
                            completion(.success((urlString)!))
                        }
                    }
                    return
                } else {
                    return
                }
    }
    
    func getToDo(completion: @escaping (Result<QuerySnapshot?, Error>) -> Void) {
        let db = Firestore.firestore()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        db.collection("user").document(uid).collection("todo")
                    .getDocuments() { (querySnapshot, error) in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(querySnapshot))
                    }
                }
        
    }
    
    func searchProperties(keyword: String, completion: @escaping (Result<QuerySnapshot?, Error>) -> Void) {
        
    }
    
}
