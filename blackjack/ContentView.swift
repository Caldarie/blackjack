//
//  ContentView.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.
//

import SwiftUI

struct ContentView: View {
    
    //Todo - Initialsise in a repository to manage state
    @State var message: String = "Press deal to start."
    @State var deck = loadJson(withFilename: "deck_of_cards")
    @State var player = Status()
    @State var dealer = Status()
    
    
    
    var body: some View {
        VStack {
            
            //Score displays at top
            Spacer()
                .frame(height: CGFloat(20))
            
            ScoreDisplay(player: $player, dealer: $dealer)
            
            Spacer()
            
            //Hands and message displayed at center
            Group{
                
                DealerHandDisplay(dealer: $dealer, message: $message)
                
                Spacer()
                    .frame(height: CGFloat(20))
                
                
                MessageDisplay(message: $message)
                
                Spacer()
                    .frame(height: CGFloat(20))
                
                PlayerHandDisplay(player: $player, message: $message)
                
            }
            
            //Buttons display at bottom
            Spacer()
            
            OptionButtons(message: $message, deck: $deck, player: $player, dealer: $dealer)
            
            Spacer()
                .frame(height: CGFloat(20))
            
        }
    }
}


func printInfo(_ value: Any){
    let t = type(of: value)
    print("'\(value)' of type '\(t)'")
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}



