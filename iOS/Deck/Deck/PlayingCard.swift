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

class PlayingCardStack: CardStack {
    typealias CardType = PlayingCard
    typealias CardStackType = PlayingCardStack
    
    init() {
        cards = [CardType]()
        initDeck()
    }
    
    func initWith(stack: CardStackType) -> CardStackType {
        self.cards = stack.cards
        return self
    }
    
    func initWith(cards: [CardType]) -> CardStackType {
        self.cards = cards
        return self
    }
    
    // MARK: - CardStack Protocol Funcs
    
    func shuffle() {
        cards.shuffleInPlace()
    }

    func count() -> Int {
        return cards.count
    }

    func cardAt(index: Int) -> CardType {
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
    
    func flip(cardStack: CardStackType) {
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

    func invert() {
        cards = cards.reverse()
    }

    func invertWith(subdeck: CardStackType) -> CardStackType {
        return PlayingCardStack().initWith(subdeck.cards.reverse())
    }

    func subdeckAt(startIndex: Int, endIndex: Int) -> CardStackType {
        let subdeck = Array(cards[startIndex...endIndex]) as [CardType]
        let range = Range.init(start: startIndex, end: endIndex)
        
        for (var index: Int = range.endIndex; index >= range.startIndex; index--) {
            cards.removeAtIndex(index)
        }
        
        return PlayingCardStack().initWith(subdeck)
    }

    // bottom of deck == 0 index
    func pop() -> CardType? {
        return cards.popLast()
    }

    func popWith(number: Int) -> CardStackType {
        let index = count() - 1
        return self.removeAt(index, withNumber:number)
    }

    func removeAt(index: Int) -> CardType {
        return cards.removeAtIndex(index) as CardType
    }

    // removes cards from index down towards zero
    func removeAt(index: Int, withNumber number: Int) -> CardStackType {
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
        return PlayingCardStack().initWith(removedCards)
    }

    func push(card: CardType) {
        cards.append(card)
    }

    func push(cards stack: CardStackType) {
        self.cards.appendContentsOf(stack.cards)
    }

    func insert(card: CardType, atIndex index: Int) {
        cards.insert(card, atIndex: index)
    }

    func insert(cards: CardStackType, atIndex index: Int) {
        let cardStack = cards
        self.cards.insertContentsOf(cardStack.cards, at: index)
    }
    
    // MARK: - private methods
    
    private func initDeck() {
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

