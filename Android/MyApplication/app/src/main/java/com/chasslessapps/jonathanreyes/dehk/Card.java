package com.chasslessapps.jonathanreyes.dehk;

/**
 * Created by jonathanreyes on 9/25/15.
 */
public class Card {
    public enum Value {
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

        private int valueEnum;

        private Value(int v) {
            this.valueEnum = v;
        }
    }

    public static enum Suit {
        SPADES (1),
        HEARTS (2),
        CLUBS (3),
        DIAMONDS (4);

        private int suitEnum;

        private Suit (int s) {
            this.suitEnum = s;
        }
    }

    private Value value;
    private Suit suit;
    private boolean faceUp;

    public Card (Value v, Suit s, boolean f) {
        this.value = v;
        this.suit = s;
        this.faceUp = f;
    }

    //returns new status of Card
    boolean flip() {
        return this.faceUp = !this.faceUp;
    }
}
