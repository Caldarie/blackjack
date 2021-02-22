//
//  ButtonViewModel.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/15.
//

import Foundation

class ButtonViewModel {
    
    public func deal(deck: [Deck]?, dealerHand: [Deck]?, playerHand: [Deck]?) -> (fromDeck: [Deck], toDealerHand: [Deck], toPlayerHand: [Deck]){
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
    
    public func hit(deck: [Deck]?, hand: [Deck]?) -> (fromDeck: [Deck], toHand: [Deck]){
        
        //retrieve a card from the deck
        let retrievedCard = Array(deck!.prefix(1))
        let currentDeck = Array(deck!.dropFirst(1))
        
        //place the card into the hand
        let currentHand = hand! + retrievedCard
        
        return(currentDeck, currentHand)
    }
    

    public func total(hand: [Deck?]) -> Int{
        var aceCount: Int = 0
        var handTotal: Int = 0
  
        for card in hand{
            
            //If jack, queen and king cards, value becomes 10
            if card!.value >= 11 && card!.value <= 13{
                handTotal += 10
            }
            
            //Returns optimal value for ACE
            else if card!.value == 14{
                aceCount += 1
                handTotal += 11
                
                //if there 1 or more aces and value exceeds 21, aces are converted to 1
                while handTotal > 21 && aceCount > 0{
                    handTotal -= 10
                    aceCount -= 1
                }
            }
            
            //If card is not a court and is numeral, value remains unchanged
            else {
                handTotal += card!.value
            }
            
        }

        return handTotal
    }
    
    
    public func result(playerScore: Int, dealerScore: Int) -> (wins: Int, losses: Int, reasonforResult: String){
        
        var currentPlayerScore: Int = 0
        var currentDealerScore: Int = 0
        var currentReasonForScore: String = ""
        
        if playerScore == 21 {
            currentPlayerScore = 1
            currentReasonForScore = "Player Blackjack! You win!"
        }else if dealerScore == 21{
            currentDealerScore = 1
            currentReasonForScore = "Dealer Blackjack. You lose."
        }else if playerScore > 21{
            currentDealerScore = 1
            currentReasonForScore = "Player Busted. You lose."
        }else if dealerScore > 21{
            currentPlayerScore = 1
            currentReasonForScore = "Dealer Busted! You win!"
        }else if playerScore < dealerScore {
            currentDealerScore = 1
            currentReasonForScore = "You lose."
        }else if playerScore > dealerScore {
            currentPlayerScore = 1
            currentReasonForScore = "You win!"
        }else{
            currentReasonForScore = "Tie. No win or loss"
        }
        
        
        return (currentPlayerScore, currentDealerScore, currentReasonForScore)
    }
    
}
