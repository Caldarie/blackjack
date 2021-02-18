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
    @Binding var displayResult: String
    @Binding var deck: [Deck]?
    @Binding var player: Status
    @Binding var dealer: Status

    private let vm = ButtonViewModel()
    
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
        
        let dealt = vm.deal(deck: deck, dealerHand: dealer.hand, playerHand: player.hand)
        
        self.isDealt = true
        self.deck = dealt.fromDeck
        self.dealer.hand = dealt.toDealerHand
        self.player.hand = dealt.toPlayerHand


        //debugging
        print("------------------deal------------------")
        print("deck count:" + String(deck!.count))
        print("dealer hand count:" + String(dealer.hand!.count))
        print("dealer hand: \(self.dealer.hand!)")
        print("player hand count:" + String(player.hand!.count))
        print("player hand: \(player.hand!)")
        print("----------------------------------------")
    }
    
    func hitAction() {
        
        //Hit the player
        let hitPlayer = vm.hit(deck: deck, hand: player.hand)
        self.player.hand = hitPlayer.toHand
        self.deck = hitPlayer.fromDeck
        
        //check the current score of dealer
        self.player.totalCardScore = vm.total(hand: player.hand!)
        self.dealer.totalCardScore = vm.total(hand: dealer.hand!)
        
        //Debugging
        print("------------player hit------------------")
        print("deck count:" + String(deck!.count))
        print("player hand count:" + String(player.hand!.count))
        print("player hand: \(player.hand!)")
        print("player total score: \(player.totalCardScore)")
        print("---------------------------------------")
        
        //Hit the dealer until score becomes 17 or higher
        while  dealer.totalCardScore < 17{
   
            let hitDealer = vm.hit(deck: deck, hand: dealer.hand)
            self.dealer.hand = hitDealer.toHand
            self.deck = hitDealer.fromDeck
            self.dealer.totalCardScore = vm.total(hand: dealer.hand!)
        }
        
        //Debugging
        print("------------dealer hit------------------")
        print("deck count:" + String(deck!.count))
        print("dealer hand count:" + String(dealer.hand!.count))
        print("dealer hand: \(dealer.hand!)")
        print("dealer total score: \(dealer.totalCardScore)")
        print("---------------------------------------")
        
        //Assigns a score to the winner
        let result = vm.result(playerScore: player.totalCardScore, dealerScore: dealer.totalCardScore)
        self.player.totalWins += result.wins
        self.dealer.totalWins += result.losses
        self.displayResult = result.reasonforResult
        print(displayResult)
        
        //reset the game
        self.isDealt = false
        self.displayResult = ""
        self.deck = loadJson(withFilename: "deck_of_cards")
        self.player.hand = []
        self.player.totalCardScore = 0
        self.dealer.hand = []
        self.player.totalCardScore = 0
        
    }
    
    func standAction() {
        //check the current score of dealer
        self.player.totalCardScore = vm.total(hand: player.hand!)
        self.dealer.totalCardScore = vm.total(hand: dealer.hand!)
        
        //Debugging
        print("------------player stand------------------")
        print("deck count:" + String(deck!.count))
        print("player hand count:" + String(player.hand!.count))
        print("player hand: \(player.hand!)")
        print("player total score: \(player.totalCardScore)")
        print("---------------------------------------")
        
        //Hit the dealer until score becomes 17 or higher
        while  dealer.totalCardScore < 17{
   
            let hitDealer = vm.hit(deck: deck, hand: dealer.hand)
            self.dealer.hand = hitDealer.toHand
            self.deck = hitDealer.fromDeck
            self.dealer.totalCardScore = vm.total(hand: dealer.hand!)
        }
        
        //Debugging
        print("------------dealer hit------------------")
        print("deck count:" + String(deck!.count))
        print("dealer hand count:" + String(dealer.hand!.count))
        print("dealer hand: \(dealer.hand!)")
        print("dealer total score: \(dealer.totalCardScore)")
        print("---------------------------------------")
        
        //Assigns a score to the winner
        let result = vm.result(playerScore: player.totalCardScore, dealerScore: dealer.totalCardScore)
        self.player.totalWins += result.wins
        self.dealer.totalWins += result.losses
        self.displayResult = result.reasonforResult
        print(displayResult)
        
        //reset the game
        self.isDealt = false
        self.displayResult = ""
        self.deck = loadJson(withFilename: "deck_of_cards")
        self.player.hand = []
        self.player.totalCardScore = 0
        self.dealer.hand = []
        self.player.totalCardScore = 0
    }
    
    
}

