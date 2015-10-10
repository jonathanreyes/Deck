//
//  Card.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

enum Side: Equatable, CustomStringConvertible {
    case Front
    case Back
    
    var description: String {
        switch self {
        case .Front:
            return "Front"
        case .Back:
            return "Back"
        }
    }
}

/**
 declares ability to flip card
 */
protocol Flippable {
    mutating func flip()
}

extension Side: Flippable {
    mutating func flip() {
        switch self {
        case .Back:
            self = .Front
        case .Front:
            self = .Back
        }
    }
}

protocol Card: Equatable {
    typealias CardValue
    var name: String { get }
    var side: Side { get set }
    var value: CardValue { get }
    
    func description() -> String
    
    func ==(lhs: Self, rhs: Self) -> Bool
}

extension Card {
    mutating func flip() {
        side.flip()
    }
}
