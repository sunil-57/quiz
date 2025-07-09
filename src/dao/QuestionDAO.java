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
