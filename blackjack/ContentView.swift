//
//  ContentView.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.
//

import SwiftUI

struct ContentView: View {
    
    //Todo - Initialsise in a repository to manage state
    @State var message: String = "Welcome. Press deal to start."
    @State var deck = loadJson(withFilename: "deck_of_cards")
    @State var player = Status()
    @State var dealer = Status()
 
    
    
    var body: some View {
        VStack {
            
            
            ScoreDisplay(player: $player, dealer: $dealer)
            
            Spacer()
                .frame(height: CGFloat(20))
            
            
            DealerHandDisplay(dealer: $dealer)
            
            Spacer()
                .frame(height: CGFloat(20))
            
            
            MessageDisplay(message: $message)
            
            Spacer()
                .frame(height: CGFloat(20))
            
            PlayerHandDisplay(player: $player)
            
            Spacer()
                .frame(height: CGFloat(20))
            
            OptionButtons(message: $message, deck: $deck, player: $player, dealer: $dealer)
            
            Spacer()
                .frame(height: CGFloat(20))
            
           
            
            //            VStack {
            //                Spacer()
            //                    .frame(height: CGFloat(20))
            //
            //                Divider()
            //                    .frame(width: CGFloat(267))
            //
            //                Spacer()
            //                    .frame(height: CGFloat(20))
            //            }
            //
            
            //
            //            Spacer()
            //                .frame(height: CGFloat(100))
            //
            //            TimerView()
            
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



