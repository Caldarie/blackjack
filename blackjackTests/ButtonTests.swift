//
//  ButtonTests.swift
//  blackjackTests
//
//  Created by Michael Nguyen on 2021/02/19.
//

import XCTest
@testable import blackjack

class ButtonTest: XCTestCase {
    
    func testSingleAce() {
        
        let playerHand: [Deck] = [
             Deck(suit: "clubs", value: 13, loc: "king_of_clubs.png"),
             Deck(suit: "hearts", value: 14, loc: "ace_of_hearts.png"),
             Deck(suit: "hearts", value: 2, loc: "2_of_hearts.png"),
             Deck(suit: "diamonds", value: 5, loc: "5_of_diamonds.png")
        ]
        let player = Status( hand: playerHand, numberOfAces: 1)
        let vm = ButtonViewModel()
        let playerTotal = vm.total(hand: player.hand!, numOfAces: player.numberOfAces)
        
        XCTAssertEqual(playerTotal.cardScore, 18)
        XCTAssertEqual(playerTotal.numOfAce, 0)  //0 means that no aces equals to 11
        
    }
    
    func testTwoAcesInHand() {
        
        let playerHand: [Deck] = [
            Deck(suit: "hearts", value: 14, loc: "ace_of_hearts.png"),
            Deck(suit: "clubs", value: 14, loc: "ace_of_clubs.png"),
            Deck(suit: "spades", value: 13, loc: "king_of_spades.png")
        ]
        let player = Status( hand: playerHand, numberOfAces: 2)
        let vm = ButtonViewModel()
        let playerTotal = vm.total(hand: player.hand!, numOfAces: player.numberOfAces)
        
        XCTAssertEqual(playerTotal.cardScore, 12)
        XCTAssertEqual(playerTotal.numOfAce, 0) //0 means that no aces equals to 11
        
    }
    
    
    func testThreeAcesInARow() {
        
        let playerHand: [Deck] = [
            Deck(suit: "hearts", value: 14, loc: "ace_of_hearts.png"),
            Deck(suit: "clubs", value: 14, loc: "ace_of_clubs.png"),
            Deck(suit: "diamonds", value: 14, loc: "ace_of_diamons.png"),
        ]
        let player = Status( hand: playerHand, numberOfAces: 3)
        let vm = ButtonViewModel()
        let playerTotal = vm.total(hand: player.hand!, numOfAces: player.numberOfAces)
        
        XCTAssertEqual(playerTotal.cardScore, 13)
        XCTAssertEqual(playerTotal.numOfAce, 1) //1 ace means only one is counted as 11
        
    }
    
}
