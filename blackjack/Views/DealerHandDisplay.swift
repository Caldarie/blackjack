//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.


import Foundation
import SwiftUI

struct DealerHandDisplay: View {
    
    @Binding var dealer: Status
    @Binding var gameState: GameState
    
    private let vm = HandDisplayViewModel()
    
    
    var body: some View {
        let arrayOfCards = vm.getImageLocations(hand: dealer.hand!)
        
        ZStack {
            ForEach(0..<arrayOfCards.count, id: \.self) { index in
                if(index == 0 && gameState == GameState.start){
                    Image(uiImage: UIImage(named: "0_back_of_card.png")!)
                        .resizable()
                        .frame(width: 99, height: 153)
                        .offset(x: vm.cardAlignment(numOfCards: arrayOfCards.count, index: index))
                    //                .aspectRatio(contentMode: .fit)
                    //                .layoutPriority(1)
                }else{
                    Image(uiImage: UIImage(named: arrayOfCards[index])!)
                        .resizable()
                        .frame(width: 99, height: 153)
                        .offset(x: vm.cardAlignment(numOfCards: arrayOfCards.count, index: index))
                }
            }
        }
    }
    
    
}
