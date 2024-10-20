//
//  FirebaseReference.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 20/10/24.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
}

struct FirebaseReference{
    static func getReference(_ collectionReference: FCollectionReference) -> CollectionReference{
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
}
