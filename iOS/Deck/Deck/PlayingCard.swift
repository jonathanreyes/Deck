//
//  PlayingCard.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

struct PlayingCard: Card {
    typealias CardValue = PlayingCardValue
    let name: String
    let value: CardValue
    let suit: Suit
    var side: Side
    
    func description() -> String {
        return "\(value.description)\(suit)"
    }
}

struct PlayingCardStack: CardStack {
    typealias CardType = PlayingCard
    typealias CardStack = PlayingCardStack
    
    // MARK: - Initializers
    
    init() {
        cards = [CardType]()
        initDeck()
    }
    
    mutating func initWith(stack: CardStack) -> CardStack {
        self.cards = stack.cards
        return self
    }
    
    mutating func initWith(cards: [CardType]) -> CardStack {
        self.cards = cards
        return self
    }
    
    // MARK: - CardStack Protocol Funcs
    
    mutating func shuffle() {
        cards.shuffleInPlace()
    }

    func count() -> Int {
        return cards.count
    }

    mutating func cardAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }
    
    func flip(var card: CardType) {
        switch card.side {
        case .Front:
            card.side = Side.Back
        case .Back:
            card.side = Side.Front
        }
    }
    
    func flip(cardStack: CardStack) {
        var cards = cardStack.cards
        for i in 0...(cards.count) {
            switch cards[i].side {
            case .Front:
                cards[i].side = Side.Back
            case .Back:
                cards[i].side = Side.Front
            }
        }
    }

    mutating func invert() {
        cards = cards.reverse()
    }

    func invertWith(subdeck: CardStack) -> CardStack {
        var returnStack = PlayingCardStack()
        return returnStack.initWith(subdeck.cards.reverse())
    }

    mutating func subdeckAt(startIndex: Int, endIndex: Int) -> CardStack {
        let subdeck = Array(cards[startIndex...endIndex]) as [CardType]
        let range = Range.init(start: startIndex, end: endIndex)
        
        for (var index: Int = range.endIndex; index >= range.startIndex; index--) {
            cards.removeAtIndex(index)
        }
        
        // structs must be set to var to be mutable
        var returnStack = PlayingCardStack()
        return returnStack.initWith(subdeck)
    }

    // bottom of deck == 0 index
    mutating func pop() -> CardType? {
        return cards.popLast()
    }

    mutating func popWith(number: Int) -> CardStack {
        let index = count() - 1
        return self.removeAt(index, withNumber:number)
    }

    mutating func removeAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }

    // removes cards from index down towards zero
    mutating func removeAt(index: Int, withNumber number: Int) -> CardStack {
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
        
        var returnStack = PlayingCardStack()
        return returnStack.initWith(removedCards)
    }

    mutating func push(card: CardType) {
        cards.append(card)
    }

    mutating func push(cards stack: CardStack) {
        self.cards.appendContentsOf(stack.cards)
    }

    mutating func insert(card: CardType, atIndex index: Int) {
        cards.insert(card, atIndex: index)
    }

    mutating func insert(cards: CardStack, atIndex index: Int) {
        let cardStack = cards
        self.cards.insertContentsOf(cardStack.cards, at: index)
    }
    
    // MARK: - private methods
    
    mutating private func initDeck() {
        let suits = [Suit.Diamond, Suit.Heart, Suit.Club, Suit.Spade]
        let values = [PlayingCardValue.Ace, PlayingCardValue.Two, PlayingCardValue.Three, PlayingCardValue.Four, PlayingCardValue.Five,
                      PlayingCardValue.Six, PlayingCardValue.Seven, PlayingCardValue.Eight, PlayingCardValue.Nine, PlayingCardValue.Ten,
                      PlayingCardValue.Jack, PlayingCardValue.Queen, PlayingCardValue.King]
        for suit in suits {
            for cardValue in values {
                let card = PlayingCard(name: "Playing Card", value: cardValue, suit: suit, side: Side.Back)
                self.push(card)
            }
        }
        
        if count() != max_count {
            assertionFailure("Playing Card Deck doesn't have 52 cards")
        }
    }
    
    // MARK: - properties
    internal var cards: [CardType]
    internal var max_count: Int = 52
}

