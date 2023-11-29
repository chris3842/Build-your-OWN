//
//  ContentView.swift
//  Build your OWN
//
//  Created by christopher robles quezada on 11/27/23.
//

import SwiftUI

struct ContentView: View {
@State private var gameScore = 0
    @State private var rotation = 0.0
    var body: some View {
        VStack {
            Text("Treasure Dice")
                .font(.title)
                .bold()
                Spacer()
            Image("treasurechest").resizable().frame(width: 245, height: 245)
            
        }
        .padding()
    }
}

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
