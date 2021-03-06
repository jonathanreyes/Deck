//
//  PlayingCard.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

struct PlayingCard: Card {
    let name: String
    let value: PlayingCardValue
    let suit: Suit
    var side: Side
    
    init(value: PlayingCardValue, suit: Suit, side: Side) {
        self.value = value
        self.name  = value.description
        self.suit  = suit
        self.side  = side
    }
    
    func description() -> String {
        return "\(name)\(suit)"
    }
}

func == (lhs: PlayingCard, rhs: PlayingCard) -> Bool {
    return lhs.value == rhs.value &&
           lhs.suit == rhs.suit
}



