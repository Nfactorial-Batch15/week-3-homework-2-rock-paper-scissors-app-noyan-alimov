//
//  ResultScreen.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 17/12/2021.
//

import SwiftUI

struct ResultScreen: View {
    @Binding var isTakeYourPickScreenActive: Bool
    
    @Binding var numberOfRounds: Int
    @Binding var numberOfPlayer1Wins: Int
    @Binding var numberOfPlayer2Wins: Int
    
    var player1Pick: PickModel
    var player2Pick: PickModel
    
    var body: some View {
        VStack {
            VStack {
                getResultText()
                Text("Score \(numberOfPlayer1Wins):\(numberOfPlayer2Wins)")
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(MyColors.purple)
            }
                .padding(.top)
            
            Spacer()
            
            ZStack {
                ZStack {
                    Pick(pick: player1Pick, width: 198, height: 128)
                }
                    .frame(width: 360, alignment: .topLeading)
                
                ZStack {
                    Pick(pick: player2Pick, width: 198, height: 128)
                        .overlay(
                            RoundedRectangle(cornerRadius: 48)
                                .stroke(MyColors.white, lineWidth: 10)
                        )
                }
                    .frame(width: 360, height: 260, alignment: .bottomTrailing)
            }
            
            Spacer()
            
            CustomButton(text: "Another round") {
                goToBeginning()
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Round #\(numberOfRounds)")
            .onAppear {
                if player1Pick > player2Pick {
                    numberOfPlayer1Wins += 1
                } else if player2Pick > player1Pick {
                    numberOfPlayer2Wins += 1
                }
            }
    }
    
    func getResultText() -> GradientText {
        if player1Pick > player2Pick {
            return GradientText(text: "Win!")
        } else if player2Pick > player1Pick {
            return GradientText(text: "Lose")
        } else {
            return GradientText(text: "Tie!")
        }
    }
    
    func goToBeginning() {
        numberOfRounds += 1
        isTakeYourPickScreenActive = false
    }
}

struct GradientText: View {
    let text: String
    @State var gradientColors: [Color] = []
    
    var body: some View {
        Text(text)
            .foregroundColor(.clear)
            .background(LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing).mask(Text(text)))
            .font(.system(size: 54, weight: .bold, design: .default))
            .onAppear {
                if text == "Win!" {
                    gradientColors = [MyColors.lightGreen, MyColors.darkGreen]
                } else if text == "Lose" {
                    gradientColors = [MyColors.lightRed, MyColors.darkRed]
                } else {
                    gradientColors = [MyColors.lightYellow, MyColors.darkYellow]
                }
            }
    }
}

struct ResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultScreen(isTakeYourPickScreenActive: .constant(false), numberOfRounds: .constant(0), numberOfPlayer1Wins: .constant(0), numberOfPlayer2Wins: .constant(0), player1Pick: .rock, player2Pick: .scissors)
    }
}
