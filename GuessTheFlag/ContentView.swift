//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mario Alberto Barragan Espinosa on 10/15/19.
//  Copyright © 2019 Mario Alberto Barragan Espinosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var currentQuestion = 0
    private var maxScore = 10

    var body: some View {
      ZStack {
          LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
              .edgesIgnoringSafeArea(.all)
          VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                    .foregroundColor(.white)
                Text(countries[correctAnswer])
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaledToFill()
            }

            ForEach(0 ..< 3) { number in
                Button(action: {
                  self.flagTapped(number)
                }) {
                    FlagImage(imageName: self.countries[number])
                }
            }
            Text("Score \(score)")
                .foregroundColor(.white)
            Text("Question \(currentQuestion)/\(maxScore)")
            .foregroundColor(.white)
            Spacer()
          }
      }
      .alert(isPresented: $showingScore) {
        Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
          if self.currentQuestion >= self.maxScore {
              self.score = 0
              self.currentQuestion = 0
            }
            self.askQuestion()
          })
      }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            score -= 1
        }
        currentQuestion += 1
        showingScore = true
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
