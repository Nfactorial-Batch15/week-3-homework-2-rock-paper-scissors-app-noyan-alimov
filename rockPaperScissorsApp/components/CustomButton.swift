//
//  Button.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 16/12/2021.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(MyColors.purple)
                .frame(width: 358, height: 50)
            Text(text)
                .foregroundColor(MyColors.white)
                .font(.system(size: 16, weight: .semibold, design: .default))
        }
        .onTapGesture(perform: onTap)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static func tapped() {
        print("tapped")
    }
    
    static var previews: some View {
        CustomButton(text: "Single player", onTap: self.tapped)
    }
}
