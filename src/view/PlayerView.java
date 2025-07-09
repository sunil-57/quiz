package view;

import controller.QuestionController;
import model.Question;

import java.util.ArrayList;
import java.util.Scanner;

public class PlayerView {
    //TODO entry to view score board
    //TODO option to start game
    //TODO option to log out
    public static void gameStartView(){
        Scanner input = new Scanner(System.in);
        QuestionController questionController = new QuestionController();
        int option = 0;
        System.out.println("Enter 1: Start Game");
        System.out.println("Enter 2: View Score Board");
        System.out.println("Enter 3: Exit");
        System.out.println("Choose option: ");
        option = Integer.parseInt(input.nextLine());
        if(option > 0){
            if(option == 1){
                questionController.startGame();
            }else if(option == 2){
                //TODO need to show the score of all players
                System.out.println("working on score boards");
            }else if(option == 3){
                System.out.println("Exiting");
            }
        }else{
            System.out.println("Invalid option. Choose from 1 to 3");
        }
    }
}
