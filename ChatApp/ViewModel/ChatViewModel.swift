//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Владимир Рябов on 18.01.2022.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
   
    
    func sendMessage(_ messageText: String) {
        guard let currrentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currrentUid).collection(chatPartnerId).document()
        
        
    }
    
}
