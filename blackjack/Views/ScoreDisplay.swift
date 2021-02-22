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
    @Binding var gameState: GameState
    
    private let vm = ScoreDisplayViewModel()
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Wins: " + String(player.totalWins))
                
                Spacer()
                    .frame(width: 20)
                
                Text("Losses: " + String(dealer.totalWins))
                
                
            }
            
            HStack{
                    
                //Show only the dealer's unhidden score until the game state finishes.
                if(gameState == GameState.start){
                    let totalUnhiddenValues = vm.calculateUnhiddenValues(hand: dealer.hand!)
                    Text("Dealer Score: " + String(totalUnhiddenValues))
                }else{
                    Text("Dealer Score: " + String(dealer.totalCardScore))
                }
                
                Spacer()
                    .frame(width: 20)
                
                Text("Player Score: " + String(player.totalCardScore))
                
            }
            
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
        
    }
    
    
    
}

