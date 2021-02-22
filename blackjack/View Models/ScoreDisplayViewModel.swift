//
//  ScoreDisplayViewModel.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/21.
//

import Foundation

class ScoreDisplayViewModel{
    //retreive a list of image locations from Deck
    public func calculateUnhiddenValues(hand: [Deck?]) -> Int{
        
        var aceCount: Int = 0
        var handTotal: Int = 0
        var firstCardValue: Int = 0
        
        for (index, card) in hand.enumerated(){
            
            //If jack, queen and king cards, value becomes 10
            if card!.value >= 11 && card!.value <= 13{
                handTotal += 10
                
                //Keeps track of the first card
                if index == 0{
                    firstCardValue = 10
                }
            }
            
            //Returns optimal value for ACE
            else if card!.value == 14{
                aceCount += 1
                handTotal += 11
                
                //Keeps track of the first card
                if index == 0{
                    firstCardValue = 11
                }
                
                //if there 1 or more aces and value exceeds 21, aces are converted to 1
                while handTotal > 21 && aceCount != 0{
                    handTotal -= 10
                    aceCount -= 1
                }
            }
            
            
            //If card is not a court and is numeral, value remains unchanged
            else {
                handTotal += card!.value
                
                //Keeps track of the first card
                if index == 0{
                    firstCardValue =  handTotal
                }
            }
        }
        return (handTotal - firstCardValue)
    }
    
}
