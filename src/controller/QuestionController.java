package controller;

import dao.QuestionDAO;
import model.Question;
import service.QuestionService;
import view.CreateQuestionView;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class QuestionController {
    private final QuestionService questionService = new QuestionService();

    public void startGame(){
        Scanner input = new Scanner(System.in);
        int answer = 0;
        ArrayList<Question> quizList = questionService.getQuestions();
        for(Question question: quizList){
            System.out.println(question.getTitle());
            question.showOptions();
            System.out.println("Choose an option: ");
            answer = Integer.parseInt(input.nextLine());
            if(question.checkAnswer(answer)){
                //TODO need to calculate score
                //TODO add the score information to the score board
                System.out.println("correct");
            }else{
                //not required just for checking purposes
                System.out.println("incorrect");
            }
        }
    }

    public void listQuestions(){
        ArrayList<Question> quizQuestion = questionService.getQuestions();
        int questionIndex = 1;
        for(Question ques: quizQuestion){
            System.out.println(questionIndex +". "+ ques.getTitle());
            ques.showOptions();
            System.out.println("Correct Option: "+ ques.getCorrectIndex());
            questionIndex++;
        }
    }

    public void createQuestion() {
        CreateQuestionView.showCreateQuestionView();
    }
    public String storeQuestion(Question question){
        if(questionService.insertQuestion(question)){
            return "inserted successfully";
        }
        else
        {
         return "failed to added the question";
        }
    }
    public void updateQuestion() {
        //TODO need to work on update a question
        // allow game master to update title, options and correct index separately
    }
}
