//
//  ContentView.swift
//  Build your OWN
//
//  Created by christopher robles quezada on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var gameScore = 0
    @State private var randomValue = 0
    @State private var rotation = 0.0
    @ State private var winMessage = ""
    var body: some View {
        NavigationView() {
            VStack {
                Text("Treasure Dice")
                    .font(.title)
                    .bold()
                Spacer()
                Image("dust \(randomValue)")
                    .resizable()
                    .frame(width: 150,height: 150)
                    .rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                HStack {
                    Button("Roll") {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation += 360
                        }
                    }
                }
                
                
            }
        }
    }
              
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...5)
            }
        }
    }
    
    struct CustomText: View {
        let text: String
        var body: some View {
            Text(text)
        }
    }
    
    struct CustomButtomStyle:ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 50)
                .font(Font.custom("marker felt", size: 24))
                .padding()
                .background(.black).opacity(configuration.isPressed ? 0.0 : 1.0)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
