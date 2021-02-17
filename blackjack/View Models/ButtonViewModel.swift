//
//  ButtonViewModel.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/15.
//

import Foundation

class ButtonViewModel {
    
    public func deal(deck: [Deck]?, dealerHand: [Deck]?, playerHand: [Deck]?) -> (newDeck: [Deck], newDealerHand: [Deck], newPlayerHand: [Deck]){
        //Shuffle the deck
        var currentDeck = deck!.shuffled()
        print(currentDeck)
        
        //deals the first initial two cards to dealer and removes it from current deck
        let currentDealerHand = Array(currentDeck.prefix(2))
        currentDeck = Array(currentDeck.dropFirst(2))
        
        //deals the second initial two cards to player and removes it from current deck
        let currentPlayerHand = Array(currentDeck.prefix(2))
        currentDeck = Array(currentDeck.dropFirst(2))
        
        return(currentDeck, currentDealerHand, currentPlayerHand)
    }
    
    public func hit(deck: [Deck]?, hand: [Deck]?) -> (newDeck: [Deck], newHand: [Deck]){
        
        //retrieve a card from the deck
        let retrievedCard = Array(deck!.prefix(1))
        let currentDeck = Array(deck!.dropFirst(1))
        
        //place the card into the hand
        let currentHand = hand! + retrievedCard
        
        return(currentDeck, currentHand)
    }
    
    public func stand() {
        print("stand")
    }
    
    
    public func total(hand: [Deck?]) -> Int{
        var totalCount = 0
        for i in hand {
            //If jack, queen and king cards, value becomes 10
            if i!.value >= 11 && i!.value <= 13{
                totalCount += 10
                //If Ace, value becomes either 1 or 11
            }else if i!.value == 14{
                if totalCount >= 11{
                    totalCount += 1
                }else{
                    totalCount += 11
                }
                //If card is numeral, add as noraml
            } else {
                totalCount = totalCount + i!.value
            }
        }
        return totalCount
    }
    
    public func result() -> Int{
        
        return 0
    }
    
}
