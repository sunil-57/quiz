package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ScoreDAO {
    private Connection conn;
    public ScoreDAO() throws SQLException, ClassNotFoundException {
        conn = DatabaseConnection.connect();
    }
    public boolean insertScore(int userId, int score) {
        String query = "INSERT INTO scoreboard(userId, score) VALUES (?,?)";
            try {
                if(conn != null)
                {
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setInt(1, userId);
                    ps.setInt(2, score);
                    return ps.executeUpdate() > 0;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        return false;
    }
}
