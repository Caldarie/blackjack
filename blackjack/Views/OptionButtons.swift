//
//  HitStandButton.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.
//

import Foundation
import SwiftUI
import Combine

struct OptionButtons: View {
    
    @Binding var isDealt: Bool
    @Binding var deck: [Deck]?
    @Binding var player: Status
    @Binding var dealer: Status

//    @Binding var dealerHand: [Deck]?
//    @Binding var playerHand: [Deck]?
//    @Binding var deck: [Deck]?
//    @Binding var dealerTotal: Int
//    @Binding var playerTotal: Int
    
//    @State private var buttonState: ButtonState = .deal
    
    private let viewModel = ButtonViewModel()
    
    var body: some View {
        HStack {
            //Deal button will disappear once its been pressed
            if !self.$isDealt.wrappedValue{
                Button(action: dealAction) {
                    Text("Deal")
                        .font(.system(size: 20))
                        .fixedSize()
                        .frame(width: CGFloat(100), height: CGFloat(52))
                        .background(Color("Primary"))
                        .cornerRadius(CGFloat(10))
                        .foregroundColor(Color("AltText"))
                    
                }
                
            }else{
                Button(action: standAction) {
                    Text("Stand")
                        .font(.system(size: 20))
                        .fixedSize()
                        .frame(width: CGFloat(100), height: CGFloat(52))
                        .background(Color("Primary"))
                        .cornerRadius(CGFloat(10))
                        .foregroundColor(Color("AltText"))
                    
                }
                
                
                Spacer()
                    .frame(width: 20)
                
                
                Button(action: hitAction) {
                    Text("Hit")
                        .font(.system(size: 20))
                        .fixedSize()
                        .frame(width: CGFloat(100), height: CGFloat(52))
                        .background(Color("Primary"))
                        .cornerRadius(CGFloat(10))
                        .foregroundColor(Color("AltText"))
                }
            }
            
        }
    }
    
    func dealAction() {
        isDealt = true
        let dealtDeck = viewModel.deal(deck: deck, dealerHand: dealer.hand, playerHand: player.hand)
        deck = dealtDeck.newDeck
        self.dealer.hand = dealtDeck.newDealerHand
        self.player.hand = dealtDeck.newPlayerHand

        //debugging
        print("deck count:" + String(deck!.count))
        print("dealer hand count:" + String(dealer.hand!.count))
        print("dealer hand: \(self.dealer.hand!)")
        print("player hand count:" + String(player.hand!.count))
        print("player hand: \(player.hand!)")

    }
    
    func hitAction() {
        
        let playerHit = viewModel.hit(deck: deck, hand: player.hand)
        self.player.hand = playerHit.newHand
        deck = playerHit.newDeck
        
        print("deck count:" + String(deck!.count))
        print("player hand count:" + String(player.hand!.count))
        print("player hand: \(player.hand!)")
        
        //check the current score of dealer
        self.dealer.totalPoints = viewModel.total(hand: dealer.hand!)
        print("dealer total: \(dealer.totalPoints)")
        
        //Dealer will hit until score becomes 17 or higher
        while  dealer.totalPoints < 17{
   
            let dealerHit = viewModel.hit(deck: deck, hand: dealer.hand)
            self.dealer.hand = dealerHit.newHand
            deck = dealerHit.newDeck
            self.dealer.totalPoints = viewModel.total(hand: dealer.hand!)
        }
//        print(hitHand)
    }
    
    func standAction() {
        isDealt = false
        viewModel.stand()
    }
    
    
}

