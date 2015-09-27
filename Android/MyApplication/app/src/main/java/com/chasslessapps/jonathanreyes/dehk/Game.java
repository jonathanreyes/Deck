package com.chasslessapps.jonathanreyes.dehk;

/**
 * Created by jonathanreyes on 9/25/15.
 */
public class Game {
    private Player[] players; //players[0] is always the host
    private CardStack gameDeck;
    private GameSettings gameSettings;

    public Game(Player host, int maxNumPlayers, CardStack initialGameDeck) {
        this.players = new Player[maxNumPlayers];
        this.players[0] = host;
        this.gameDeck = initialGameDeck;
    }
}
