//
//  ContentView.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 16/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfRounds: Int = 1
    @State var numberOfPlayer1Wins: Int = 0
    @State var numberOfPlayer2Wins: Int = 0
    
    var body: some View {
        WelcomeScreen(numberOfRounds: $numberOfRounds, numberOfPlayer1Wins: $numberOfPlayer1Wins, numberOfPlayer2Wins: $numberOfPlayer2Wins)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
