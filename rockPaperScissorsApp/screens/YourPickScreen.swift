//
//  YourPickScreen.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 17/12/2021.
//

import SwiftUI

struct YourPickScreen: View {
    @Binding var isTakeYourPickScreenActive: Bool
    
    @Binding var numberOfRounds: Int
    @Binding var numberOfPlayer1Wins: Int
    @Binding var numberOfPlayer2Wins: Int
    
    var pick: PickModel
    @State var isOpponentScreenActive = false
    
    var body: some View {
        VStack {
            NavigationLink(isActive: $isOpponentScreenActive) {
                OpponentScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, player1Pick: pick)
            } label: {
                EmptyView()
            }

            
            Text("Your pick")
                .font(.system(size: 54, weight: .bold, design: .default))
                .padding(.bottom, 12)
            
            Text("Score \(numberOfPlayer1Wins):\(numberOfPlayer2Wins)")
                .font(.system(size: 17, weight: .medium, design: .default))
                .foregroundColor(MyColors.purple)
            
            Spacer()
            
            Pick(pick: pick)
            
            Spacer()
            
            CustomButton(text: "Next") {
                isOpponentScreenActive = true
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Round #\(numberOfRounds)")
    }
}

struct YourPickScreen_Previews: PreviewProvider {
    static var previews: some View {
        YourPickScreen(isTakeYourPickScreenActive: .constant(false), numberOfRounds: .constant(0), numberOfPlayer1Wins: .constant(0), numberOfPlayer2Wins: .constant(0), pick: .paper)
    }
}
