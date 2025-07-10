package dao;

import model.Question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestionDAO {
    private Connection conn;

    public QuestionDAO() throws SQLException, ClassNotFoundException {
        this.conn = DatabaseConnection.connect();
    }

    public boolean insertQuestion(Question question){
        boolean isInserted = false;
        String query = "insert into question(title, option1, option2, option3, option4, correctOption) VALUES (?,?,?,?,?,?)";
        try {
            if(conn != null)
            {
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, question.getTitle());
                ps.setInt(2, question.getOptions()[0]);
                ps.setInt(3, question.getOptions()[1]);
                ps.setInt(4, question.getOptions()[2]);
                ps.setInt(5, question.getOptions()[3]);
                ps.setInt(6, question.getCorrectIndex());
                if(ps.executeUpdate() > 0){
                    isInserted = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isInserted;
    }
    public ResultSet loadQuestions(){
        ResultSet questionSet = null;
        String query = "Select * from question";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            questionSet = ps.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return questionSet;
    }
}
