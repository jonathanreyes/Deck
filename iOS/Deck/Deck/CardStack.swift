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
    typealias CardStackType
    
    var cards: [CardType] { get set }
    
    func initWith(stack: CardStackType) -> CardStackType
    
    func initWith(cards: [CardType]) -> CardStackType
    
    func shuffle()

    func count() -> Int
    
    func cardAt(index: Int) -> CardType
    
    // changes Side enum
    func flip(card: CardType)
    
    func flip(cards: CardStackType)
    
    // 1,2,3 -> 3,2,1
    func invert()
    
    func invertWith(subdeck: CardStackType) -> CardStackType
    
    func subdeckAt(startIndex: Int, endIndex: Int) -> CardStackType
    
    func pop() -> CardType?
    
    func popWith(number: Int) -> CardStackType
    
    func removeAt(index: Int) -> CardType
    
    func removeAt(index: Int, withNumber number: Int) -> CardStackType
    
    func push(card: CardType)
    
    func push(cards stack: CardStackType)
    
    func insert(card: CardType, atIndex index: Int)
    
    func insert(cards: CardStackType, atIndex index: Int)
    
}