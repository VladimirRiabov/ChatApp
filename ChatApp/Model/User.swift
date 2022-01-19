//
//  User.swift
//  ChatApp
//
//  Created by Владимир Рябов on 19.01.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}
