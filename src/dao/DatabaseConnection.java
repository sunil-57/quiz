package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static String path = "jdbc:mysql://localhost:3306/";
    private static String dbName = "quizdb";
    private static String username = "root";
    private static String password = "";

    public static Connection connect() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(path+dbName, username, password);
        return conn;
    }

}
