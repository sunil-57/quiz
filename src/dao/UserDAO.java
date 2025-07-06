package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    public boolean insertUser(User user){
        boolean isUserInserted = false;
        Connection conn = null;
        try {
            conn = DatabaseConnection.connect();
            if(conn != null){
                String query = "INSERT INTO user (username, password) VALUES (?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getPassword());
                int row = ps.executeUpdate();
                if(row > 0){
                    isUserInserted = true;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return isUserInserted;
    }
}
