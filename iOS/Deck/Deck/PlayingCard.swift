//
//  PlayingCard.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

enum Suit: CustomStringConvertible {
    case Club
    case Diamond
    case Heart
    case Spade
    
    var description: String {
        switch self {
        case .Club:
            return "Club"
        case .Diamond:
            return "Diamond"
        case .Heart:
            return "Heart"
        case .Spade:
            return "Spade"
        }
    }
}

enum PlayingCardValue: Int, CustomStringConvertible {
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
            return "Two"
        case .Three:
            return "Three"
        case .Four:
            return "Four"
        case .Five:
            return "Five"
        case .Six:
            return "Six"
        case .Seven:
            return "Seven"
        case .Eight:
            return "Eight"
        case .Nine:
            return "Nine"
        case .Ten:
            return "Ten"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        }
    }
}

struct PlayingCard: Card {
    typealias CardValue = PlayingCardValue
    let name: String
    let value: CardValue
    let suit: Suit
    let side: Side
    
    func description() -> String {
        return "\(value.description) of \(suit)s"
    }
}

class PlayingCardDeck: CardStack {
    typealias CardType = PlayingCard
    
    var cards: [CardType]
    
    init() {
        cards = [CardType]()
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }

    func count() -> Int {
        return cards.count
    }

    func cardAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }

    func invert() {
        cards = cards.reverse()
    }

    func invertWith(subdeck: [CardType]) -> [CardType] {
        return subdeck.reverse()
    }

    func subdeckAt(startIndex: Int, endIndex: Int) -> [CardType] {
        let subdeck = Array(cards[startIndex...endIndex]) as [CardType]
        let range = Range.init(start: startIndex, end: endIndex)
        
        for (var index: Int = range.endIndex; index >= range.startIndex; index--) {
            cards.removeAtIndex(index)
        }
        
        return subdeck
    }

    // bottom of deck == 0 index
    func pop() -> CardType? {
        return cards.popLast()
    }

    func popWith(number: Int) -> [CardType] {
        let index = count() - 1
        return self.removeAt(index, withNumber:number)
    }

    func removeAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }

    // removes cards from index down towards zero
    func removeAt(index: Int, withNumber number: Int) -> [CardType] {
        let cardIndex = index
        // this is because array starts at 0
        let startIndex = cardIndex - number + 1
        let range = Range.init(start: startIndex, end: cardIndex)
        
        // this gets a copy of the array that is being removed, copy is returned
        let removedCards = Array(cards[range.startIndex...range.endIndex]) as [CardType]
        
        // theres probably a prettier/more functional way of doing this loop
        // this removes the cards from the cards array
        for (var index: Int = range.endIndex; index >= range.startIndex; index--) {
            cards.removeAtIndex(index)
        }
        return removedCards
    }

    func push(card: CardType) {
        cards.append(card)
    }

    func push(cards: [CardType]) {
        self.cards.appendContentsOf(cards)
    }

    func insert(card: CardType, atIndex index: Int) {
        cards.insert(card, atIndex: index)
    }

    func insert(cards: [CardType], atIndex index: Int) {
        self.cards.insertContentsOf(cards, at: index)
    }
    
}

