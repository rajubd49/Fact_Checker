//
//  TaskManager.swift
//  Fact Checker
//
//  Created by Raju on 27/3/20.
//  Copyright © 2020 Raju. All rights reserved.
//

import Foundation
import FirebaseFirestore

class TaskManager: NSObject {
    
    static let shared = TaskManager()

    
    func checkUrl(urlString: String, _ completion: @escaping(_ urlModel: URLModel?) -> Void) {
        Firestore.firestore().collection("urls").document(urlString).getDocument { (snapshot, error) in
            if let snapshotData = snapshot?.data(), snapshotData.count > 0 {
                let urlModel = URLModel(dictionary: snapshotData)
                completion(urlModel)
            } else {
                completion(nil)
            }
        }
    }
}
