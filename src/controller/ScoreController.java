package controller;

import dao.ScoreDAO;
import model.Scoreboard;
import view.PlayerView;

import java.sql.SQLException;

public class ScoreController {

    public boolean keepScore(Scoreboard scoreboard) {
        try {
            ScoreDAO scoreDAO = new ScoreDAO();
            return scoreDAO.insertScore(scoreboard.getUserId(), scoreboard.getScore());
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
