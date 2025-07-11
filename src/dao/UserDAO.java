package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private Connection conn = null;
    public UserDAO() throws SQLException, ClassNotFoundException {
        conn = DatabaseConnection.connect();
    }
    public boolean insertUser(User user){
        boolean isUserInserted = false;
        try {
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return isUserInserted;
    }

    public User checkUser(String username, String password) {
        User user = new User();
        String query = "Select userid, username, password, isGameMaster from user where username = ? and password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet userSet = ps.executeQuery();
            while(userSet.next()){
                user.setUserId(userSet.getInt("userid"));
                user.setUsername(userSet.getString("username"));
                user.setPassword(userSet.getString("password"));
                user.setGameMaster(userSet.getBoolean("isgamemaster"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
}
