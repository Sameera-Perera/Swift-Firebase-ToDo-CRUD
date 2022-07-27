//
//  ToDoViewModel.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.

import Foundation
import UIKit
import Firebase
import Combine

class ToDoViewModel: ObservableObject{
    @Published var isLoadingActive = false
    @Published var isInfoActive = false
    @Published var infoMsg = ""
    
    @Published var todos = [ToDoItem]()
    
    private let toDoService:ToDoServiceProtocol
    
    init(toDoService: ToDoServiceProtocol = ToDoService()) {
        self.toDoService = toDoService
        getToDos()
    }

    func createToDo(title:String,
                    description:String,
                    image: UIImage){
        isInfoActive = false
        infoMsg = ""
        isLoadingActive = true

        toDoService.createToDoItem(
            title: title,
            description: description,
            image: image
        ) { result in
                switch result {
                    case .success:
                        self.isLoadingActive = false
                        self.infoMsg = "ToDo crate successfully"
                        self.isInfoActive = true
                    case let .failure(error):
                        print(error)
                        self.isLoadingActive = false
                        self.infoMsg = error.localizedDescription
                        self.isInfoActive = true
                }
            }
    }
    
    func getToDos(){
        isLoadingActive = true
            toDoService.getToDo() { result in
                switch result {
                    case let .success(querySnapshot):
                        guard let documents = querySnapshot?.documents else {
                            return
                        }
                    
                        self.todos = documents.compactMap { (queryDocumentSnapshot) -> ToDoItem? in
                            return try? queryDocumentSnapshot.data(as: ToDoItem.self)
                        }
                    self.isLoadingActive = false
                case .failure(_):
                    self.isLoadingActive = false
                }
            }
        }
    
    func updateToDo(todo: ToDoItem){
            toDoService.updateUserDetails(
                nic: nic, mobile: mobile, location: location) {result in
                    switch result {
                        case .success:
                            self.isUpdateDetailsActive = false
                            self.isSuccessActive = true
                        case let .failure(error):
                            print(error)
                            self.isUpdateDetailsActive = false
                            self.errorMsg = error.localizedDescription
                            self.isErrorActive = true
                    }
                }
        }
}
