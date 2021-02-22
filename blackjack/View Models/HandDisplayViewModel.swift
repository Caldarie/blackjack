//
//  HandViewModel.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/16.
//

import Foundation
import SwiftUI

class HandDisplayViewModel{
    
    //retreive a list of image locations from Deck
    public func getImageLocations(hand: [Deck]) -> [String]{
        var stringLoc: [String] = []
        for i in hand{
            stringLoc.append(i.loc)
        }
        return stringLoc
    }
    
    //Adjust cards to centre whenver the hand increases
    func cardAlignment(numOfCards: Int, index: Int) -> CGFloat{
        var offsetX: CGFloat
        
        if(numOfCards == 2){
            offsetX = -30.0 + (CGFloat(index) * 50.0)
        }else if(numOfCards == 3){
            offsetX = -50.0 + (CGFloat(index) * 50.0)
        }else if(numOfCards == 4){
            offsetX = -70.0 + (CGFloat(index) * 50.0)
        }else if(numOfCards == 5){
            offsetX = -80.0 + (CGFloat(index) * 40.0)
        }else if(numOfCards == 6){
            offsetX = -80.0 + (CGFloat(index) * 30.0)
        }else{
            offsetX = -80.0 + (CGFloat(index) * 20.0)
        }
        
        return offsetX
    }
}
