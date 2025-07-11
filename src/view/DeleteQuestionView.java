package view;

import controller.QuestionController;

public class DeleteQuestionView {

    public static void showDeleteQuestionView(){
        QuestionController questionController = new QuestionController();
        questionController.listQuestions();
    }
}
