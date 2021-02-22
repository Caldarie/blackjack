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
    
    private let vm = HandDisplayViewModel()
    
    
    var body: some View {
        let arrayOfCards = vm.getImageLocations(hand: player.hand!)
        
        ZStack {
            ForEach(0..<arrayOfCards.count, id: \.self) { index in
                
                Image(uiImage: UIImage(named: arrayOfCards[index])!)
                    .resizable()
                    .frame(width: 99, height: 153)
                    .offset(x: vm.cardAlignment(numOfCards: arrayOfCards.count, index: index))
            }
        }
    }
    
}




