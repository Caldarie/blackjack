//
//  HandViewModel.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/16.
//

import Foundation


class HandDisplayViewModel{
    
    public func getImageLocations(hand: [Deck]) -> [String]{
        var stringLoc: [String] = []
        for i in hand{
            stringLoc.append(i.loc)
        }
        print(stringLoc)
        return stringLoc
    }
}
