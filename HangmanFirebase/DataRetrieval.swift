//
//  DataRetrieval.swift
//  HangmanFirebase
//
//  Created by James Goldston on 12/21/21.
//

import Foundation
import Firebase

class modelData: ObservableObject {
    @Published var hangmanWord = ""
    
    init() {
        
        FirebaseApp.configure()
        getData()
        print("ran initialize")
                
    }
    func getData() {
        
        let db = Firestore.firestore()
        let collection = db.collection("CurrentHangman")
        let document = collection.document("HangmanWordToday")
        document.getDocument { docSnap, error in
            if docSnap != nil {
                
                let data = docSnap!.data()
                self.hangmanWord = data!["word"] as! String
                
            } else {
                
                print(error?.localizedDescription ?? "unknown error")
                
            }
        }
    }
    
}
