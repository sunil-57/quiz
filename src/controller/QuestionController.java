package controller;

import model.Question;
import model.Scoreboard;
import model.User;
import service.QuestionService;
import view.CreateQuestionView;
import view.DeleteQuestionView;


import java.util.ArrayList;
import java.util.Scanner;

public class QuestionController {
    private final QuestionService questionService = new QuestionService();

    public boolean startGame(User user){
        boolean isGameEnded = false;
        ScoreController scoreController = new ScoreController();
        Scanner input = new Scanner(System.in);
        int answer = 0;
        int score = 0;
        ArrayList<Question> quizList = questionService.getQuestions();
        for(Question question: quizList){
            System.out.println(question.getTitle());
            question.showOptions();
            System.out.println("Choose an option: ");
            answer = Integer.parseInt(input.nextLine());
            if(question.checkAnswer(answer)){
                score++;
            }
        }
        Scoreboard scoreboard = new Scoreboard(user.getUserId(),score);
        isGameEnded = scoreController.keepScore(scoreboard);
        return isGameEnded;
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

    public void editQuestion() {
    }

    public void deleteQuestion() {
        DeleteQuestionView.showDeleteQuestionView();
    }
}
