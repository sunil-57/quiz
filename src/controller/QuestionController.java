package controller;

import dao.QuestionDAO;
import model.Question;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestionController {

    public ArrayList<Question> getQuestions() {
        ArrayList<Question> questionsList = new ArrayList<>();
        QuestionDAO questiondao = null;
        try {
            questiondao = new QuestionDAO();
            ResultSet questionSet = questiondao.loadQuestions();
            while(questionSet.next()){
                //TITLE, OPTIONS(1-4), CORRECT OPTION
                Question question = new Question(
                        questionSet.getString("title"),
                        questionSet.getInt("option1"),
                        questionSet.getInt("option2"),
                        questionSet.getInt("option3"),
                        questionSet.getInt("option4"),
                        questionSet.getInt("correctOption"));
                questionsList.add(question);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return questionsList;
    }
}
