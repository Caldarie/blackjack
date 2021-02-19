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
        
        VStack{
            HStack{
                Text("Wins: " + String(player.totalWins))
                
                Spacer()
                    .frame(width: 20)
                
                Text("Losses: " + String(dealer.totalWins))
                
                
            }
            
            HStack{
                Text("Player Score: " + String(player.totalCardScore))
                
                Spacer()
                    .frame(width: 20)
                
                Text("Dealer Score: " + String(dealer.totalCardScore))
                
            }
            
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
//        Spacer()
        
    }
    
    
    
}

