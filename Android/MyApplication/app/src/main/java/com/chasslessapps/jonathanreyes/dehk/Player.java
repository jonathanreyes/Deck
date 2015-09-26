package com.chasslessapps.jonathanreyes.dehk;

import java.util.Random;

/**
 * Created by jonathanreyes on 9/25/15.
 */
public class Player {
    private int playerId;

    public Player() {
        this.playerId = (new Random()).nextInt(101);
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int p) {
        this.playerId = p;
    }
}
