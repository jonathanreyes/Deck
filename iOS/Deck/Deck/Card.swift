//
//  Card.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

enum Side: Equatable {
    case Front
    case Back
}

protocol Card: Equatable {
    typealias CardValue
    var name: String { get }
    var side: Side { get }
    var value: CardValue { get }
    
    func description() -> String
    
    func ==(lhs: Self, rhs: Self) -> Bool
}


