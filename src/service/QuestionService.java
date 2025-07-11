package service;

import controller.QuestionController;
import dao.QuestionDAO;
import model.Question;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class QuestionService {
    QuestionDAO questiondao;
    {
        try {
            questiondao = new QuestionDAO();
        } catch (SQLException | ClassNotFoundException ex) {
            throw new RuntimeException(ex);
        }
    }

    public ArrayList<Question> getQuestions() {
        ArrayList<Question> questionsList = new ArrayList<>();

            ResultSet questionSet = questiondao.loadQuestions();

                try {
                    while (questionSet.next()){
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
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }


        return questionsList;
    }

    public boolean insertQuestion(Question question) {
        if(questiondao.insertQuestion(question)){
            return true;
        }else{
            return false;
        }
    }
}
