package view;

import controller.UserController;

import java.util.Scanner;

public class SignUpView {
    public static void showSignUpView(){
        UserController userController = new UserController();
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter username: ");
        String username = scan.nextLine();
        System.out.println("Enter password: ");
        String password = scan.nextLine();
        if(userController.signUp(username, password)){
            System.out.println("Signed Up successfully");
        }else{
            System.out.println("Failed to sign up");
        }
    }
}
