//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Владимир Рябов on 18.01.2022.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super .init()
        //chek is user is logged in value or nil gets
//        try? Auth.auth().signOut()
    
        userSession = Auth.auth().currentUser
        fetchUser()
       
        
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, link: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
//            guard let user = result?.user else {return}
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String,
                  fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else {return}
            
            self.tempCurrentUser = user
            
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]
            COLLECTION_USERS.document(user.uid).setData(data) {_ in
                
                self.didAuthenticateUser = true
                self.fetchUser()
            }
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {return}
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageUrl" : imageUrl]) { _ in
                self.userSession = self.tempCurrentUser
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else {
            return
            
        }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
          
            
            guard let user = try? snapshot?.data(as: User.self) else {
                
                return}
            
            self.currentUser = user
            
        }
    }
}
