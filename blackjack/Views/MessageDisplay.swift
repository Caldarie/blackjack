//
//  MessageDisplay.swift
//  blackjack
//
//  Created by Michael Nguyen on 2021/02/18.
//


import SwiftUI

struct MessageDisplay: View {
    
    @Binding var message: String
    
    var body: some View {
        
        Text(message)
        
    }
    
    
    
    
}
