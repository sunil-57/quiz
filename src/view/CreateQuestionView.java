package view;

import controller.QuestionController;
import model.Question;

import java.util.Scanner;

public class CreateQuestionView {
    public static void showCreateQuestionView(){
        QuestionController questionController = new QuestionController();
        Scanner input = new Scanner(System.in);
        System.out.println("Create a new question....");
        System.out.println("Enter question title: ");
        String title = input.nextLine();
        System.out.println("Enter option 1: ");
        int option1 = Integer.parseInt(input.nextLine());
        System.out.println("Enter option 2: ");
        int option2 = Integer.parseInt(input.nextLine());
        System.out.println("Enter option 3: ");
        int option3 = Integer.parseInt(input.nextLine());
        System.out.println("Enter option 4: ");
        int option4 = Integer.parseInt(input.nextLine());
        System.out.println("Enter correct option number: ");
        int correctIndex = Integer.parseInt(input.nextLine());
        System.out.println(questionController.storeQuestion(new Question(title, option1, option2, option3, option4,correctIndex)));
    }
}
