package com.chasslessapps.jonathanreyes.dehk;

import java.util.ArrayList;
import java.util.Random;

/**
 * Created by jonathanreyes on 9/25/15.
 */
public class CardStack {
    /*bottom of a card stack is at index 0, cards on top of it are at subsequent indeces*/

    private ArrayList<Card> cardsInStack;

    /*Constructors*/
    public CardStack(ArrayList<Card> cards) {
        this.cardsInStack = cards;
    }

    public CardStack() {
        this.cardsInStack = new ArrayList<Card>();
    }

    public CardStack(ArrayList<Card> bottomStack, ArrayList<Card> topStack) {
        bottomStack.addAll(topStack);
        this.cardsInStack = bottomStack;
    }

    public int getNumCards() {
        return this.cardsInStack.size();
    }

    public void addCardToTop (Card c) {
        cardsInStack.add(c);
    }

    public Card drawCard () {
        return cardsInStack.get(cardsInStack.size() - 1);
    }

    public void shuffle() {
        //create a temporary copy of cardsInStack
        ArrayList<Card> temp = new ArrayList<Card>();
        temp.addAll(this.cardsInStack);

        //empty cardsInStack
        cardsInStack.clear();

        //randomly select cards from temp and add them to cardsInStack
        Random rand = new Random();
        int randomIdx;
        while (temp.size() > 0) {
            //using formula (rand.nextInt(max - min + 1) + min),
            //where min = 0 and max = (temp.size() - 1)
            randomIdx = rand.nextInt(temp.size());

            cardsInStack.add(temp.get(randomIdx));
        }
    }

    public Card getNthCardFromTop(int n) {
        return cardsInStack.get(n);
    }

    public CardStack getSubDeck(int startIdx, int endIdx) {
        return new CardStack((ArrayList<Card>) this.cardsInStack.subList(startIdx, endIdx));
    }
}
