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
    var totalPoints: Int
}
