//
//  UserDetails.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.
//

import FirebaseFirestoreSwift
import Firebase

struct UserDetails: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var firstName: String
    var lastName: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
    }
}
