package com.chasslessapps.jonathanreyes.dehk;

/**
 * Created by jonathanreyes on 9/25/15.
 */
public class Card {
    public enum Rank {
        ACE (1),
        TWO (2),
        THREE (3),
        FOUR (4),
        FIVE (5),
        SIX (6),
        SEVEN (7),
        EIGHT (8),
        NINE (9),
        TEN (10),
        JACK (11),
        QUEEN (12),
        KING (13);

        private int rankEnum;

        private Rank(int r) {
            this.rankEnum = r;
        }
    }

    public enum Suit {
        SPADES (1),
        HEARTS (2),
        CLUBS (3),
        DIAMONDS (4);

        private int suitEnum;

        private Suit (int s) {
            this.suitEnum = s;
        }
    }

    private Rank rank;
    private Suit suit;
    private boolean faceUp;

    public Card (Rank r, Suit s, boolean f) {
        this.rank = r;
        this.suit = s;
        this.faceUp = f;
    }

    //returns new status of Card
    boolean flip() {
        return this.faceUp = !this.faceUp;
    }
}
