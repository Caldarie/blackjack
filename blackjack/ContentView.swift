//
//  ContentView.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDealt: Bool = false
    @State var deck = loadJson(withFilename: "deck_of_cards")
    @State var player = Status(totalWins: 0, hand: [], totalPoints: 0)
    @State var dealer = Status(totalWins: 0, hand: [], totalPoints: 0)
    
    
    //    print(deckOfCards!)
    //    let reddit = deckOfCards[1]
    //    print(reddit.loc)
    
    var body: some View {
        VStack {
            
            
            ResultDisplay(player: $player, dealer: $dealer)
            
            
            Spacer()
                .frame(height: CGFloat(20))
            
            
            DealerHandDisplay(dealer: $dealer)
            
            Spacer()
                .frame(height: CGFloat(20))
            
            PlayerHandDisplay(player: $player)
            
            Spacer()
                .frame(height: CGFloat(20))
            
            OptionButtons(isDealt: $isDealt, deck: $deck, player: $player, dealer: $dealer)
            
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



