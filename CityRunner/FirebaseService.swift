//
//  FirebaseService.swift
//  CityRunner
//
//  Created by Fateh Khan on 29/04/2021.
//

import Foundation
import Firebase

class FirebaseService {
    let firestoreDB = Firestore.firestore()
    
    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        firestoreDB.settings = settings
    }
    
    func addCity(city name: String) {
        firestoreDB.collection("cities").document("LA").setData([
            "name": name,
            "state": "CA",
            "country": "USA"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
