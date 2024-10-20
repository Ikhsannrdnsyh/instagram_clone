//
//  ImageUploaderService.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 20/10/24.
//

import UIKit
import FirebaseStorage

class ImageUploaderService{
    static let shared = ImageUploaderService()
    
    private init(){ }
    
    func uploadImage(image: UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.6) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/Avatar/\(filename)")
        
        ref.putData(imageData, metadata: nil){ metadata, error in
            if let error = error{
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
