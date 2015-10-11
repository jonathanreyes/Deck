//
//  Stackable.swift
//  Deck
//
//  Created by Justin Shiiba on 9/27/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

/**
 Basic protocol for all CardStacks - any stack of CardTypes
 */
protocol Stackable {
    typealias CardType
    
    var cards: [CardType] { get set }
    
    mutating func shuffle()

    func count() -> Int
    
    mutating func cardAt(index: Int) -> CardType
    
    mutating func invert()
    
    mutating func pop() -> CardType?
    
    mutating func removeAt(index: Int) -> CardType
    
    mutating func push(card: CardType)
    
    mutating func push(cards stack: Self)
    
    mutating func insert(card: CardType, atIndex index: Int)

}


// Funcs to implement
//mutating func initWith(stack: CardStack) -> CardStack
//mutating func initWith(cards: [CardType]) -> CardStack
//func flip(cards: CardStack)
//func invertWith(subdeck: CardStack) -> CardStack
//mutating func subdeckAt(startIndex: Int, endIndex: Int) -> CardStack
//mutating func popWith(number: Int) -> CardStack
//mutating func removeAt(index: Int, withNumber number: Int) -> CardStack
//mutating func insert(cards: CardStack, atIndex index: Int)

