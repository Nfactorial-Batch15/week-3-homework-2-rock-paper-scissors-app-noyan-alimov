//
//  PassToOpponentScreen.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 17/12/2021.
//

import SwiftUI

struct PassToOpponentScreen: View {
    @Binding var isTakeYourPickScreenActive: Bool
    
    @Binding var numberOfRounds: Int
    @Binding var numberOfPlayer1Wins: Int
    @Binding var numberOfPlayer2Wins: Int
    
    @Binding var player1Pick: PickModel
    
    @State var isOpponentPickScreenActive = false
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $isOpponentPickScreenActive) {
                TakeYourPickScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, player: "Player 2", player1Pick: player1Pick)
            } label: {
                EmptyView()
            }

            
            Text("Pass the phone to your opponent")
                .font(.system(size: 54, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            CustomButton(text: "Ready to continue") {
                isOpponentPickScreenActive = true
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Round #\(numberOfRounds)")
    }
}

struct PassToOpponentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PassToOpponentScreen(isTakeYourPickScreenActive: .constant(true), numberOfRounds: .constant(0), numberOfPlayer1Wins: .constant(0), numberOfPlayer2Wins: .constant(0), player1Pick: .constant(.scissors))
    }
}
