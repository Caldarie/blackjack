//
//  ScoreDisplayViewModel.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/21.
//

import Foundation

class ScoreDisplayViewModel{
    //retreive a list of image locations from Deck
    public func calculateUnhiddenValues(hand: [Deck]) -> Int{
        var cardValues: [Int] = []
        
        for i in hand{
            cardValues.append(i.value)
        }
        
        let shownValues = cardValues.dropFirst(1).reduce(0, +)
        
        return shownValues
    }
}
