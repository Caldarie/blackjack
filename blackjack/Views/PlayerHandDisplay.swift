//
//  Player.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/15.
//

import Foundation
import SwiftUI

struct PlayerHandDisplay: View {
    
    @Binding var player: Status
    @Binding var message: String
    
    private let vm = HandDisplayViewModel()
    
    
    var body: some View {
        let arrayOfCards = vm.getImageLocations(hand: player.hand!)
        
        ZStack {
            ForEach(0..<arrayOfCards.count, id: \.self) { index in
                
                Image(uiImage: UIImage(named: arrayOfCards[index])!)
                    .resizable()
                    .frame(width: 99, height: 153)
                    .offset(x: cardAlignment(numOfCards: arrayOfCards.count, index: index))
            }
        }
    }
    
    //Adjust cards to centre whenver the hand increases
    func cardAlignment(numOfCards: Int, index: Int) -> CGFloat{
        var offsetX: CGFloat
        if(numOfCards == 2){
            offsetX = -20.0 + (CGFloat(index) * 50.0)
        }else if(numOfCards == 3){
            offsetX = -50.0 + (CGFloat(index) * 50.0)
        }else{
            offsetX = -70.0 + (CGFloat(index) * 50.0)
            }
        return offsetX
    }
}




