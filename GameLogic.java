package com.tictactoe;

public class GameLogic {

    public static boolean checkWinner(String[][] board, String s) {

        for(int i=0;i<3;i++) {
            if(board[i][0].equals(s) && board[i][1].equals(s) && board[i][2].equals(s))
                return true;

            if(board[0][i].equals(s) && board[1][i].equals(s) && board[2][i].equals(s))
                return true;
        }

        if(board[0][0].equals(s) && board[1][1].equals(s) && board[2][2].equals(s))
            return true;

        if(board[0][2].equals(s) && board[1][1].equals(s) && board[2][0].equals(s))
            return true;

        return false;
    }
}