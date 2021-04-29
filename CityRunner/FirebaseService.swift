//
//  FirebaseService.swift
//  CityRunner
//
//  Created by Fateh Khan on 29/04/2021.
//

import Foundation
import Firebase

class FirebaseService: ObservableObject {
    let firestoreDB = Firestore.firestore()
@Published var cities = [String]()
    
    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        firestoreDB.settings = settings

//        firestoreDB.collection("cities").getDocuments(completion: { (documentSnapshot, error) in
//            guard let document = documentSnapshot else {
//              print("Error fetching document: \(error!)")
//              return
//            }
////            print("Current data: \(data)")
//            document.documents.forEach { (doc) in
//                print(doc.data())
//                self.cities.append(doc.data()["name"] as! String)
//            }
//        })
        
//        d
        
        firestoreDB.collection("cities")
            .addSnapshotListener { documentSnapshot, error in
              guard let fbDocument = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
                self.cities = []
                for document in fbDocument.documents {
                    let city = document.data()
                    self.cities.append(city["name"] as! String)
                }
            }
    }
    
    func addCity(city name: String) {
        firestoreDB.collection("cities").document(String(name.dropLast(2))).setData([
            "name": name,
            "state": "CA",
            "country": "USA"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.cities.append(name)
            }
        }
    }
}
