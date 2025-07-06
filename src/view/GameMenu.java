package view;

import controller.UserController;

import java.util.Scanner;

public class GameMenu {
    public static void showMenu(){
        Scanner scan = new Scanner(System.in);
        System.out.println("Are you ready for the quizzz!!");
        System.out.println("Enter 1: Sign Up");
        System.out.println("Enter 2: Log In");
        System.out.println("Enter 3: Exit");
        int option = Integer.parseInt(scan.nextLine());
        if(option == 1){
            SignUpView.showSignUpView();
        }
    }
}
