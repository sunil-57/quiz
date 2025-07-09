package view;

import controller.QuestionController;
import model.Question;

import java.util.ArrayList;

public class PlayerView {
    //TODO need to work
    public static void gameStart(){
        QuestionController questionController = new QuestionController();
        ArrayList<Question> quizList = questionController.getQuestions();
    }
}
