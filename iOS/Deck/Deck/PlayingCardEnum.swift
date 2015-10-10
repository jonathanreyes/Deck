//
//  PlayingCardEnum.swift
//  Deck
//
//  Created by Justin Shiiba on 9/28/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

enum Suit: CustomStringConvertible, Equatable {
    case Club
    case Diamond
    case Heart
    case Spade
    
    var description: String {
        switch self {
        case .Club:
            return "♣"
        case .Diamond:
            return "♦"
        case .Heart:
            return "♥"
        case .Spade:
            return "♠"
        }
    }
}

enum PlayingCardValue: Int, CustomStringConvertible, Equatable {
    case Ace   = 1
    case Two   = 2
    case Three = 3
    case Four  = 4
    case Five  = 5
    case Six   = 6
    case Seven = 7
    case Eight = 8
    case Nine  = 9
    case Ten   = 10
    case Jack  = 11
    case Queen = 12
    case King  = 13
    
    var description: String {
        switch self {
        case .Ace:
            return "Ace"
        case .Two:
            return "2"
        case .Three:
            return "3"
        case .Four:
            return "4"
        case .Five:
            return "5"
        case .Six:
            return "6"
        case .Seven:
            return "7"
        case .Eight:
            return "8"
        case .Nine:
            return "9"
        case .Ten:
            return "10"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        }
    }
}