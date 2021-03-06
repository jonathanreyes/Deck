//
//  CardStack.swift
//  Deck
//
//  Created by Justin Shiiba on 10/10/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

struct CardStack<T>: Stackable {
    typealias CardType = T
    
    internal var cards: [T]
    
    init(cards: [T]) {
        self.cards = cards
    }
    
    mutating func shuffle() {
        cards.shuffleInPlace()
    }
    
    func count() -> Int {
        return cards.count
    }
    
    mutating func cardAt(index: Int) -> T {
        return cards.removeAtIndex(index) as T
    }
    
    mutating func invert() {
        cards = cards.reverse()
    }
    mutating func pop() -> T? {
        return cards.popLast()
    }
    
    mutating func removeAt(index: Int) -> T {
        return cards.removeAtIndex(index) as T
    }
    
    mutating func push(card: T) {
        cards.append(card)
    }
    
    mutating func push(cards stack: CardStack) {
        self.cards.appendContentsOf(stack.cards)
    }
    
    mutating func insert(card: T, atIndex index: Int) {
        cards.insert(card, atIndex: index)
    }
}
