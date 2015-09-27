//
//  Card.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

enum Side {
    case Front
    case Back
}

protocol Card {
    typealias CardValue
    var name: String { get }
    var side: Side { get }
    var value: CardValue { get }
    
    func description() -> String
}

protocol CardStack {
    typealias CardType
    
    var cards: [CardType] { get set }

    func shuffle()

    func count() -> Int

    func cardAt(index: Int) -> CardType

    func invert()

    func invertWith(subdeck: [CardType]) -> [CardType]

    func subdeckAt(startIndex: Int, endIndex: Int) -> [CardType]

    func pop() -> CardType?

    func popWith(number: Int) -> [CardType]

    func removeAt(index: Int) -> CardType

    func removeAt(index: Int, withNumber number: Int) -> [CardType]

    func push(card: CardType)

    func push(cards: [CardType])

    func insert(card: CardType, atIndex index: Int)

    func insert(cards: [CardType], atIndex index: Int)

}