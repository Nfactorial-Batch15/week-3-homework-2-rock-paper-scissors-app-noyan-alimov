//
//  Pick.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 16/12/2021.
//

import SwiftUI

struct Pick: View {
    let pick: PickModel
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        ZStack {
            MyColors.lightBlue
            
            Text(pick.getEmoji())
                .font(.system(size: 78, weight: .medium, design: .default))
        }
        .frame(width: width != nil ? width : 342, height: height != nil ? height : 128)
            .cornerRadius(48)
    }
}

struct Pick_Previews: PreviewProvider {
    static var previews: some View {
        Pick(pick: .rock)
    }
}
