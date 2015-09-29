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

