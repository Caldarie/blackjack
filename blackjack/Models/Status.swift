//
//  AppState.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/16.
//

import Foundation

struct Status: Decodable {
    
    var totalWins: Int
    var hand: [Deck]?
    var totalCardScore: Int
    
    //initialise and make it as optional
    init(totalWins: Int = 0,
         hand: [Deck]? = [],
         totalCardScore: Int = 0){
        
        self.totalWins = totalWins
        self.hand = hand
        self.totalCardScore = totalCardScore
    }
}
