//
//  PlayingCard.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

enum Suit {
    case Club
    case Diamond
    case Heart
    case Spade
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
            return "One"
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
}

class PlayingDeck: CardStack {
    typealias CardType = PlayingCard
    
    var cards: [CardType] {
        get {
            return self.cards
        }
        set(newCards) {
            self.cards = newCards
        }
    }
    
    init() {
        cards = []
    }
    
    func shuffle() {
        print("hello")
    }

    func count() -> Int {
        return cards.count
    }

    func cardAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }

    func invert() -> [CardType] {
        return cards.reverse()
    }

    func invertWith(subdeck: [CardType]) -> [CardType] {
        return subdeck.reverse()
    }

    func subdeckAt(startIndex: Int, endIndex: Int) -> [CardType] {
        return Array(cards[startIndex...endIndex]) as [CardType]
    }

    // bottom of deck == 0 index
    func pop() -> CardType? {
        return cards.popLast()
    }

    func popWith(number: Int) -> [CardType] {
        let range = Range.init(start: self.count() - number, end: self.count())
        let poppedCards = Array(cards[self.count() - number...self.count()]) as [CardType]
        cards.removeRange(range)
        return poppedCards
    }

    func removeAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }

    func removeAt(index: Int, withNumber number: Int) -> [CardType] {
        let range = Range.init(start: index, end: index + number)
        let poppedCards = Array(cards[index...(index+number)]) as [CardType]
        cards.removeRange(range)
        return poppedCards
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

