//
//  TakeYourPickScreen.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 16/12/2021.
//

import SwiftUI

struct TakeYourPickScreen: View {
    @Binding var isTakeYourPickScreenActive: Bool
    
    @Binding var numberOfRounds: Int
    @Binding var numberOfPlayer1Wins: Int
    @Binding var numberOfPlayer2Wins: Int
    
    var player: String? = nil
    
    @State var isYourPickScreenActive = false
    @State var isPassToOpponentScreenActive = false
    @State var isResultScreenActive = false
    
    @State var chosenPick: PickModel?
    var player1Pick: PickModel?
    
    func goToYourPickScreen(pick: PickModel) {
        chosenPick = pick
        if player == "Player 1" {
            isPassToOpponentScreenActive = true
        } else if player == "Player 2" {
            isResultScreenActive = true
        } else {
            isYourPickScreenActive = true
        }
    }
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $isYourPickScreenActive) {
                if let chosenPick = chosenPick {
                    YourPickScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, pick: chosenPick)
                }
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $isPassToOpponentScreenActive) {
                if let $chosenPick = Binding($chosenPick) {
                    PassToOpponentScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, player1Pick: $chosenPick)
                }
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $isResultScreenActive) {
                if let chosenPick = chosenPick {
                    if let player1Pick = player1Pick {
                        ResultScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, player1Pick: player1Pick, player2Pick: chosenPick)
                    }
                }
            } label: {
                EmptyView()
            }
            
            
            Text("Take your pick")
                .font(.system(size: 54, weight: .bold, design: .default))
                .padding(.bottom, 12)
            
            if let player = player {
                ScoreText(text: "\(player) . Score \(numberOfPlayer1Wins):\(numberOfPlayer2Wins)")
            } else {
                ScoreText(text: "Score \(numberOfPlayer1Wins):\(numberOfPlayer2Wins)")
            }
            
            VStack(alignment: .center, spacing: 20) {
                Pick(pick: .rock)
                    .onTapGesture {
                        goToYourPickScreen(pick: .rock)
                    }
                
                Pick(pick: .paper)
                    .onTapGesture {
                        goToYourPickScreen(pick: .paper)
                    }
                
                Pick(pick: .scissors)
                    .onTapGesture {
                        goToYourPickScreen(pick: .scissors)
                    }
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Round #\(numberOfRounds)")
    }
}

struct ScoreText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 17, weight: .medium, design: .default))
            .foregroundColor(MyColors.purple)
            .padding(.bottom, 74)
    }
}

struct TakeYourPickScreen_Previews: PreviewProvider {
    static var previews: some View {
        TakeYourPickScreen(isTakeYourPickScreenActive: .constant(true), numberOfRounds: .constant(0), numberOfPlayer1Wins: .constant(0), numberOfPlayer2Wins: .constant(0))
    }
}
