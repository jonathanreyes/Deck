//
//  CardStack.swift
//  Deck
//
//  Created by Justin Shiiba on 9/27/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

/**
 Basic protocol for all CardStacks - any stack of CardTypes
 */
protocol CardStack {
    typealias CardType
    typealias CardStack
    
    var cards: [CardType] { get set }
    
    mutating func initWith(stack: CardStack) -> CardStack
    
    mutating func initWith(cards: [CardType]) -> CardStack
    
    mutating func shuffle()

    func count() -> Int
    
    mutating func cardAt(index: Int) -> CardType
    
    func flip(card: CardType)
    
    func flip(cards: CardStack)
    
    mutating func invert()
    
    func invertWith(subdeck: CardStack) -> CardStack
    
    mutating func subdeckAt(startIndex: Int, endIndex: Int) -> CardStack
    
    mutating func pop() -> CardType?
    
    mutating func popWith(number: Int) -> CardStack
    
    mutating func removeAt(index: Int) -> CardType
    
    mutating func removeAt(index: Int, withNumber number: Int) -> CardStack
    
    mutating func push(card: CardType)
    
    mutating func push(cards stack: CardStack)
    
    mutating func insert(card: CardType, atIndex index: Int)
    
    mutating func insert(cards: CardStack, atIndex index: Int)
    
}