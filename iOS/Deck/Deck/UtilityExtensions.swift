//
//  UtilityExtensions.swift
//  Deck
//
//  Created by Justin Shiiba on 9/27/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

// Inspired by: https://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift

import Foundation

extension CollectionType where Index == Int {
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}