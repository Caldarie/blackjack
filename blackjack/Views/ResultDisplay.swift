//
//  ResultDisplay.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.
//

import SwiftUI

struct ResultDisplay: View {
    
    @Binding var player: Status
    @Binding var dealer: Status

    
    var body: some View {
        HStack {
            
            Text(
                String(playerStatus.totalWins)
            )
            .fixedSize()
            .font(.system(size: 72))
            
            Spacer()
                .frame(width: 20)
            
            Text(
                String(dealerStatus.totalWins)
            )
            .fixedSize()
            .font(.system(size: 72))
            
        }
    }
    
    
    
}

