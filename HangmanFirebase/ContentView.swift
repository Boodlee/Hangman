//
//  ContentView.swift
//  HangmanFirebase
//
//  Created by James Goldston on 12/20/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    
    @EnvironmentObject private var model: modelData
    @State var attempts = 0
    @State var guess = ""
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var wordArray: [String] {
        let a = model.hangmanWord.components(separatedBy: "")
        return a
    }
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var trueAlphabet:[String] {
        let a = alphabet.components(separatedBy: "")
        return a
    }
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                Text("Trys remaining:").bold()
                Text(String(attempts)).bold()
                Spacer()
            }
            
            Spacer()
            
            /*ForEach(0..<model.hangmanWord.count) { _ in
             
             Text("_")
             
             }
             */
            HStack {
                ForEach(0..<5) { _ in
                    
                    Text("_").font(.title)
                    
                }
            }
            Text("Next Guess").bold()
            TextField("", text: $guess)
                .textFieldStyle(.roundedBorder)
                .frame(width: 100)
                .background(.mint)
            Spacer()
            
            LazyHGrid(rows: threeColumnGrid) {
                ForEach(trueAlphabet, id: \.self) { i in
                    
                    Button(action: {
                        
                    }, label: {
                        Text(i).foregroundColor(.black).font(.title).bold()
                    })
                    
                }
            }.padding(.leading, 150)
            
            Spacer()
        }.background(LinearGradient(colors: [.blue,.mint], startPoint: .topLeading, endPoint: .bottomTrailing))
        
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
