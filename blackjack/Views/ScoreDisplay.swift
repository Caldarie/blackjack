//
//  ResultDisplay.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.
//

import SwiftUI

struct ScoreDisplay: View {
    
    @Binding var player: Status
    @Binding var dealer: Status

    
    var body: some View {
        HStack {
            
            Text(
                String(player.totalWins)
            )
            .fixedSize()
            .font(.system(size: 72))
            
            Spacer()
                .frame(width: 20)
            
            Text(
                String(dealer.totalWins)
            )
            .fixedSize()
            .font(.system(size: 72))
            
        }
    }
    
    
    
}

