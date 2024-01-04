//
//  ContentView.swift
//  RPS GAME
//
//  Created by Macmaurice Osuji on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock","Paper","Scissors"]
    @State private var computersMove = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var status = false
    @State private var playCount = 0
    
   
    
    var rule: String {
        if status == false {
            return "Win"
        }
        return "Lose"
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.2, green: 0.3, blue: 0.63),location: 0.3),
                .init(color: Color(red: 0.20, green: 0.42, blue: 0.12),location: 0.3)
            ], center: .zero, startRadius: 200, endRadius: 850)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text("Rock Paper Scissors")
                    .fontDesign(.rounded)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                VStack (alignment: .center, spacing: 20) {
                    VStack {
                        //Text(moves[computersMove]) //TESTING (COMPUTERS CHOICE)
                        Text("Computer has Selected")
                            .fontDesign(.monospaced)
                            .font(.headline)
                    }
                    HStack {
                        Text("Try to")
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                        Text(rule + "!")
                            .fontDesign(.serif)
                            .fontWeight(.heavy)
                            .font(.largeTitle.weight(.semibold))
                    }
                    Spacer()
                    HStack {
                        ForEach(0..<3) {
                            number in Button {
                                winLose(moveTapped(number))
                            }label: {
                                Image(moves[number])
                                    .renderingMode(.original)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                                    
                            }
                        }
                    }
                    
                }
                .frame(maxWidth: 400)
                .padding(.vertical, 150)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                
                Spacer()
                Spacer()
                Text("Your current Score is \(score)")
                    .font(.title2)
                Spacer()
               
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
        }
    }///
    
    func display (_ num: Int) -> String {
        let selected = moves[computersMove]
        return selected
        
    }
    
    func winLose (_ result: String) {
        if result == "Win" && rule == "Win" || result == "Lose" && rule == "Lose" {
            scoreTitle = "You win!"
            score += 1
        }
        else if result == "Tie" {
            scoreTitle = "It's a Tie!"
            score += 0
        }
        else {
            scoreTitle = "You lose!"
            if score >= 1 {
                score -= 1
            }
            
        }
        showingScore = true
        playCount += 1
    }
    
    func moveTapped (_ num: Int) -> String {
        if num == computersMove {
            return "Tie"
        }
        else if num == 1 {
            if computersMove == 0 {
                return "Win"
            }
        }
        else if num == 2 {
            if computersMove == 1 {
                return "Win"
            }
        }
        else if num == 0 {
            if computersMove == 2 {
                return "Win"
            }
        }
        return "Lose"
    }
    func askQuestion() {
        status.toggle()
        computersMove = Int.random(in: 0...2)
        
    }
    
}///

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
