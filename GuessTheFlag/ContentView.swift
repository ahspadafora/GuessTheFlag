//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amber Spadafora on 10/7/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var isShowingAlert = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var isCorrect = false
    @State private var animationAmount: Double = 0
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of").foregroundColor(.white)
                    Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle).fontWeight(.black)
                    
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        withAnimation {
                            self.flagTapped(number)
                        }
                    }) {
                        FlagImage(image: Image(self.countries[number]))
                    }
                    .rotation3DEffect(.degrees(self.animationAmount),
                                      axis: (x: 0, y: 1, z: 0))
                    
                }
                Text("Score: \(score)").foregroundColor(.white)
                Spacer()
            }
        }.alert(isPresented: $isShowingAlert) { () -> Alert in
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
            animationAmount += 360
        } else {
            scoreTitle = "Wrong! The is the flag of \(countries[number])"
            score -= 1
        }
        self.askQuestion()
        //isShowingAlert = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
