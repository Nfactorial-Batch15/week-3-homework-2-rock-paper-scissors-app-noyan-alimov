//
//  OpponentThinkingScreen.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 17/12/2021.
//

import SwiftUI

struct OpponentScreen: View {
    @Binding var isTakeYourPickScreenActive: Bool
    
    @Binding var numberOfRounds: Int
    @Binding var numberOfPlayer1Wins: Int
    @Binding var numberOfPlayer2Wins: Int
    
    let picks: [PickModel] = [.rock, .paper, .scissors]
    let player1Pick: PickModel
    
    @State var player2Pick: PickModel = .rock
    @State var isResultScreenActive = false
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $isResultScreenActive) {
                ResultScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, player1Pick: player1Pick, player2Pick: player2Pick)
            } label: {
                EmptyView()
            }

            
            Text("Your opponent's pick")
                .font(.system(size: 54, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
//            if player2Pick != nil {
                Pick(pick: player2Pick)
//            } else {
//                ZStack {
//                    MyColors.lightBlue
//                    Image("Loading")
//                }
//                    .frame(width: 342, height: 128)
//            }
            
            Spacer()
            
//            if player2Pick != nil {
                CustomButton(text: "Next") {
                    isResultScreenActive = true
                }
//            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Round #\(numberOfRounds)")
            .onAppear {
                let player2PickOptional = picks.randomElement()
                if let player2PickValue = player2PickOptional {
                    player2Pick = player2PickValue
                }
            }
    }
}

struct OpponentScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpponentScreen(isTakeYourPickScreenActive: .constant(false), numberOfRounds: .constant(0), numberOfPlayer1Wins: .constant(0), numberOfPlayer2Wins: .constant(0), player1Pick: .rock)
    }
}
