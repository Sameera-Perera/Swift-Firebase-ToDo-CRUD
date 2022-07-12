//
//  ToDoItem.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-09.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct ToDoItem: Identifiable, Codable  {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var description: String
    var image: String
    var isCompleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case image
        case isCompleted = "is_completed"
    }
}
