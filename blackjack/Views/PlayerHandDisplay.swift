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

    var body: some View {
//        GeometryReader { g in
//          HStack {
//            Text("Overview").frame(width: g.size.width / 3)
//            Text("Bio").frame(width: g.size.width / 3)
//            Text("Location").frame(width: g.size.width / 3)
//          }
//        }
        HStack {
            Spacer().overlay(Text("OverView").bold())
            Spacer().overlay(Text("Bio").bold())
            Spacer().overlay(Text("Location").bold())

        }
    }
}
