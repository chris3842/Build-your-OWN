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
    @State private var gameWon = false
    var body: some View {
        NavigationView {
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
                        if gameWon {
                            gameScore = 0
                            gameWon = false
                    
                        } else {
                                
                            }
                        }
                    }
                }
                
                NavigationLink("How To Play", destination: InstructionsView())
                    .font(Font.custom("Marker Felt",size: 24))
                    .padding()
                Spacer()
            }
            .sheet(isPresented: $gameWon, content: {
                WinningView()
            })
        }

    struct WinningView: View {
        var body: some View {
            VStack {
                Text("congratulations! You won")
                    .font(.title)
                    .bold()
            }
        }
    }
    
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...5)
                checkGameResult()
            }
        }
    }
    
    func checkGameResult() {
        if randomValue == 3 {
            gameWon = true
        } else if gameScore >= 3 {
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
    
    struct InstructionsView: View {
        var body: some View {
            VStack {
                Image("dust 1").resizable().frame(width: 150, height:  150)
                Text("Treasure Dice game").font(.title)
                VStack(alignment: .leading){
                    Text("in Treasure Dice you need get threechests to win the game. if you dont get three chests and get three dust u lose the game.")
                        .padding()
                    Text("first you press the roll button then it rolls and what ever u get thats what u have as one for right now.")
                        .padding()
                    Text("after getting three dust u will lose and get no gold and you dont win the game")
                        .padding()
                    Text("if you get three chests you will win the game and restart the game to play again")
                    
                }
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

