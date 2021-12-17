//
//  WelcomeScreen.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 16/12/2021.
//

import SwiftUI

struct WelcomeScreen: View {
    @State var isTakeYourPickScreenActive: Bool = false
    
    @Binding var numberOfRounds: Int
    @Binding var numberOfPlayer1Wins: Int
    @Binding var numberOfPlayer2Wins: Int
    
    @State var isMultiPlayer = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(isActive: $isTakeYourPickScreenActive) {
                    TakeYourPickScreen(isTakeYourPickScreenActive: $isTakeYourPickScreenActive, numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins, player: isMultiPlayer ? "Player 1" : nil)
                } label: {
                    EmptyView()
                }
                
                Image("WelcomeScreenBackground").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome to the game!")
                        .font(.system(size: 54, weight: .bold, design: .default))
                        .foregroundColor(MyColors.white)
                    
                    Spacer()

                    CustomButton(text: "Single player") {
                        isMultiPlayer = false
                        isTakeYourPickScreenActive = true
                    }
                    CustomButton(text: "Multi player") {
                        isMultiPlayer = true
                        isTakeYourPickScreenActive = true
                    }
                }
                    .padding(.top, 40)
                    .padding(.bottom, 100)
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen(numberOfRounds: .constant(0), numberOfPlayer1Wins: .constant(0), numberOfPlayer2Wins: .constant(0))
    }
}
