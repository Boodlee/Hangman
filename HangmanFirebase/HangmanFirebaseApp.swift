//
//  HangmanFirebaseApp.swift
//  HangmanFirebase
//
//  Created by James Goldston on 12/20/21.
//

import SwiftUI
import Firebase

@main
@available(iOS 15.0, *)
struct HangmanFirebaseApp: App {
    
    @State var model = modelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
