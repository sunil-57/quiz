package view;

import controller.UserController;

import java.util.Scanner;

public class LoginView {
    public static void showLogInView(){
        UserController userController = new UserController();
        Scanner scan = new Scanner(System.in);
        System.out.println("Welcome, let's Get Started with the Quizes");
        System.out.println("Enter username: ");
        String username = scan.nextLine();
        System.out.println("Enter password: ");
        String password = scan.nextLine();
        if(!userController.logIn(username, password)){
            System.out.println("Log in fail");
        }
    }
}
