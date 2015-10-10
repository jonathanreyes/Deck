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
        
        let twoSpades = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Spade, side: Side.Back)
        let twoHearts = PlayingCard(name: "Playing Card", value: PlayingCardValue.Two, suit: Suit.Heart, side: Side.Back)
        let threeDiamonds = PlayingCard(name: "Playing Card", value: PlayingCardValue.Three, suit: Suit.Diamond, side: Side.Back)
        
        let array = [twoSpades, threeDiamonds, twoHearts]
        
        var playingDeck = CardStack<PlayingCard>(cards: array)
        var card = playingDeck.cardAt(1)
        print(card.description() + " " + card.side.description)
        card.flip()
        print(card.description() + " " + card.side.description)
    }
}

