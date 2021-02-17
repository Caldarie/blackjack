//  blackjack
//
//  Created by Michael Nguyen on 2021/02/13.


import Foundation
import SwiftUI

struct DealerHandDisplay: View {
    
    @Binding var dealer: Status
    
    
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: retrievePicture())!)
                .resizable()
                .frame(width: 99, height: 153)
                .aspectRatio(contentMode: .fit)
                .layoutPriority(1)
            
            Image(uiImage: UIImage(named: retrievePicture())!)
                .resizable()
                .frame(width: 99, height: 153)
                .aspectRatio(contentMode: .fit)
                .layoutPriority(1)
            
        }
    }
}


func retrievePicture() -> String {
    let deckOfCards = loadJson(withFilename: "deck_of_cards")
    let chosenCard = deckOfCards?[1]
    let cardImgLoc = chosenCard?.loc
    return cardImgLoc!
    //    print(deckOfCards!)
    //    let reddit =
    //    print(reddit.loc)
    
}
