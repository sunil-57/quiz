package view;

import controller.UserController;

import java.util.Scanner;

public class QuizGame {
    public static void main(String[] args) {
        UserController userController = new UserController();
        Scanner scan = new Scanner(System.in);
        System.out.println("Are you ready for the quizzz!!");
        System.out.println("Enter 1: Sign Up");
        System.out.println("Enter 2: Log In");
        System.out.println("Enter 3: Exit");
        int option = Integer.parseInt(scan.nextLine());
        if(option == 1){
            System.out.println("Enter username: ");
            String username = scan.nextLine();
            System.out.println("Enter password: ");
            String password = scan.nextLine();
            if(userController.signUp(username, password)){
                System.out.println("Signed Up successfully");
            }
        }
    }
}
