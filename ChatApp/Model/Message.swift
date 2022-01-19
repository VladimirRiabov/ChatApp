//
//  Message.swift
//  ChatApp
//
//  Created by Владимир Рябов on 18.01.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: Bool
    let toId: String
    let read: String
    let text: String
    let timestamp: String
}
