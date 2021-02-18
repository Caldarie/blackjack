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
      HStack {
        ForEach(ArrayOfCardImages(), id: \.self) { value in
            Image(uiImage: UIImage(named: value)!)
                .resizable()
                .frame(width: 99, height: 153)
                .aspectRatio(contentMode: .fit)
                .layoutPriority(1)
        }
     }
    }
    

    func ArrayOfCardImages() -> [String]{
        let imageLocations = vm.getImageLocations(hand: player.hand!)
        return imageLocations
    }
    
    
}
