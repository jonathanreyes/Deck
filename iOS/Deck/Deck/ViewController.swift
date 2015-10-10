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
        
//        let deck = PlayingCardStack()
//        print(deck.count())
//        deck.shuffle()
//        printDeck(deck, withMessage: "shuffle")
//        
//        let cards = deck.popWith(5)
//        printDeck(cards, withMessage: "dealt 5 cards")

//        testInvertSubDeck()
        //testCards()
    }
    
//    func testInvertSubDeck() {
//        let twoSpades = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Spade, side: Side.Back)
//        let twoHearts = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Heart, side: Side.Back)
//        let threeDiamonds = PlayingCard(name: "Playing Card", value: PlayingCardValue.Three, suit: Suit.Diamond, side: Side.Back)
//        
//        var stack = PlayingCardStack()
//        stack.initWith([twoSpades, threeDiamonds, twoHearts])
//        
//        printDeck(stack, withMessage: "before")
//        let subdeck = stack.invertWith(stack.subdeckAt(0, endIndex: 1))
//        printDeck(stack, withMessage: "stack")
//        printDeck(subdeck, withMessage: "subdeck")
//    }
//
//
//    func testCards() {
//        let twoSpades = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Spade, side: Side.Back)
//        let twoHearts = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Heart, side: Side.Back)
//        
//        var deck = PlayingCardStack()
//        
//        print("count: \(deck.count())")
//        
//        let poppedCard = deck.pop()
//        
//        if let c = poppedCard {
//            print("Popped card: \(c.description())")
//            deck.push(c)
//        } else {
//            print("no card")
//        }
//        
//        printDeck(deck, withMessage: "after insert")
//        
//        deck.invert()
//        
//        printDeck(deck, withMessage: "inverted deck")
//        
//        var insertCards = PlayingCardStack()
//        insertCards.initWith([twoSpades, twoHearts])
//        
//        deck.insert(insertCards, atIndex: 0)
//        
//        printDeck(deck, withMessage: "inserting two spade/hearts")
//        
//        var poppedCards = deck.removeAt(4, withNumber:2)
//        
//        printDeck(deck, withMessage: "should not have popped cards");
//        printDeck(poppedCards, withMessage: "popped 2 cards")
//        
//        deck.insert(poppedCards, atIndex: 0)
//        printDeck(deck, withMessage: "popped two and placed at bottom")
//
//        poppedCards = deck.popWith(2)
//        printDeck(deck, withMessage: "popped two")
//
//        poppedCards.invert()
//
//        deck.push(cards: poppedCards)
//        printDeck(deck, withMessage: "pushed reversed popped cards")
//
//        let subdeck = deck.subdeckAt(1, endIndex: 3)
//        printDeck(subdeck, withMessage: "got subdeck")
//
//        deck.push(cards: subdeck)
//        printDeck(deck, withMessage: "pushed subdeck back")
//
//        deck.shuffle()
//        printDeck(deck, withMessage: "shuffle deck")
//        
//    }
    
//    func printDeck(cardDeck: PlayingCardStack, withMessage message: String) {
//        print("\(message): [", terminator: "")
//        for card in cardDeck.cards {
//            print("\(card.description()), ", terminator: "")
//        }
//        print("]")
//    }
}

