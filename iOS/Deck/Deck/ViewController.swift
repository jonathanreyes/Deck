//
//  ViewController.swift
//  Deck
//
//  Created by Justin Shiiba on 9/25/15.
//  Copyright © 2015 ChasslessApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testCards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func testCards() {
        let twoSpades = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Spade, side: Side.Back)
        let twoHearts = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Heart, side: Side.Back)
        let nine = PlayingCard(name: "Playing Card", value: PlayingCardValue.Nine, suit: Suit.Club, side: Side.Back)
        let king = PlayingCard(name: "Playing Card", value: PlayingCardValue.King, suit: Suit.Heart, side: Side.Front)
        let ace = PlayingCard(name: "Playing Card", value: PlayingCardValue.Ace, suit: Suit.Diamond, side: Side.Front)
        
        let deck = PlayingCardDeck()
        
        deck.push(nine)
        deck.push(king)
        
        print("count: \(deck.count())")
        
        let poppedCard = deck.pop()
        
        if let c = poppedCard {
            print("Popped card: \(c)")
            deck.push(c)
        } else {
            print("no card")
        }
        
        printDeck(deck, withMessage: "inserting \(ace.value.description) at index 1")
        
        deck.insert(ace, atIndex: 1)
        
        printDeck(deck, withMessage: "after insert")
        
        deck.invert()
        
        printDeck(deck, withMessage: "inverted deck")
        
        let insertCards = [twoSpades, twoHearts]
        deck.insert(insertCards, atIndex: 0)
        
        printDeck(deck, withMessage: "inserting two spade/hearts")
        
        var poppedCards = deck.removeAt(4, withNumber:2)
        printDeck(deck, withMessage: "popped 2 cards")
        
        deck.insert(poppedCards, atIndex: 0)
        printDeck(deck, withMessage: "popped two and placed at bottom")
        
        poppedCards = deck.popWith(2)
        printDeck(deck, withMessage: "popped two")
        
        poppedCards = poppedCards.reverse()
        
        deck.push(poppedCards)
        printDeck(deck, withMessage: "pushed reversed popped cards")
        
        let subdeck = deck.subdeckAt(1, endIndex: 3)
        printDeck(deck, withMessage: "got subdeck: \(subdeck)\n deck:")
        
        deck.push(subdeck)
        printDeck(deck, withMessage: "pushed subdeck back")
        
        deck.shuffle()
        printDeck(deck, withMessage: "shuffle deck")
        deck.shuffle()
        printDeck(deck, withMessage: "shuffle deck")
        deck.shuffle()
        printDeck(deck, withMessage: "shuffle deck")
        
    }
    
    func printDeck(cardDeck: PlayingCardDeck, withMessage message: String) {
        print("\(message): [", terminator: "")
        for card in cardDeck.cards {
            print("\(card.description()), ", terminator: "")
        }
        print("]")
    }
}

