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
    
    @Binding var gameState: GameState
    @Binding var message: String
    @Binding var deck: [Deck]?
    @Binding var player: Status
    @Binding var dealer: Status
   
    
    private let vm = ButtonViewModel()
    
    var body: some View {
        HStack {
            switch gameState{
            case .reset:
                Button(action: dealAction) {
                    Text("Deal")
                        .font(.system(size: 20))
                        .fixedSize()
                        .frame(width: CGFloat(100), height: CGFloat(52))
                        .background(Color("Primary"))
                        .cornerRadius(CGFloat(10))
                        .foregroundColor(Color("AltText"))
                }
            case .start:
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
            case .finished:
                Button(action: resetAction) {
                    Text("Play Again")
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
        
        //Variables updated for deal action
        let dealt = vm.deal(deck: deck, dealerHand: dealer.hand, playerHand: player.hand)
        self.deck = dealt.fromDeck
        self.dealer.hand = dealt.toDealerHand
        self.player.hand = dealt.toPlayerHand
        updatePlayerScores()
        updateDealerScores()
        
        //Update UI
        self.gameState = GameState.start
        self.message = "Hit or Stand?"
    }
    
    func hitAction() {
                
        //Hit the player
        let hitPlayer = vm.hit(deck: deck, hand: player.hand)
        self.player.hand = hitPlayer.toHand
        self.deck = hitPlayer.fromDeck
        updatePlayerScores()
        
        //If player has blackjack or busts, deal is hit
        if(player.totalCardScore > 20){
            hitDealer()
            calculateTotalScore()
        }
        
      
    }
        
    
    func standAction() {
        hitDealer()
        calculateTotalScore()
    }
    
    func resetAction(){
        self.message = "Press deal to start."
        self.deck = loadJson(withFilename: "deck_of_cards")
        self.player.hand = []
        self.player.totalCardScore = 0
        self.player.numberOfAces = 0
        self.dealer.hand = []
        self.dealer.totalCardScore = 0
        self.player.numberOfAces = 0
        self.gameState = GameState.reset
    }
    
    
    func hitDealer(){
        //Hit the dealer until score becomes 17 or higher
        while  dealer.totalCardScore < 17{
            
            let hitDealer = vm.hit(deck: deck, hand: dealer.hand)
            self.dealer.hand = hitDealer.toHand
            self.deck = hitDealer.fromDeck
            updateDealerScores()
        }
    }
    
    
    func calculateTotalScore(){
        //Assigns a score to the winner
        let result = vm.result(playerScore: player.totalCardScore, dealerScore: dealer.totalCardScore)
        self.player.totalWins += result.wins
        self.dealer.totalWins += result.losses
        
        //Updates UI
        self.message = result.reasonforResult
        self.gameState = GameState.finished
    }
    
    func updatePlayerScores(){
        let playerTotal = vm.total(hand: player.hand!, numOfAces: player.numberOfAces)
        self.player.totalCardScore = playerTotal.cardScore
        self.player.numberOfAces = playerTotal.numOfAce
        
        //Debugging
        print("------------player stand------------------")
        print("deck count:" + String(deck!.count))
        print("player hand count:" + String(player.hand!.count))
        print("player hand: \(player.hand!)")
        print("player total score: \(player.totalCardScore)")
        print("player number of aces: \(player.numberOfAces)")
        print("---------------------------------------")
    }
    
    func updateDealerScores(){
        let dealerTotal = vm.total(hand: dealer.hand!, numOfAces: dealer.numberOfAces)
        self.dealer.totalCardScore = dealerTotal.cardScore
        self.dealer.numberOfAces = dealerTotal.numOfAce
        
        //Debugging
        print("------------dealer hit------------------")
        print("deck count:" + String(deck!.count))
        print("dealer hand count:" + String(dealer.hand!.count))
        print("dealer hand: \(dealer.hand!)")
        print("dealer total score: \(dealer.totalCardScore)")
        print("dealer number of aces: \(dealer.numberOfAces)")
        print("---------------------------------------")
        
    }
    
}

