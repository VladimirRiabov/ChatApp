//
//  ImageUploader.swift
//  ChatApp
//
//  Created by Владимир Рябов on 18.01.2022.
//

import Firebase
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        
        //url of the profile image
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
       
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Ошибка при загрузке фото\(error.localizedDescription)")
                return
            }
            
            //send us back profile image url
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
