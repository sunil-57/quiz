package model;

import java.time.LocalDate;

public class Scoreboard {
    private int userId;
    private int score;
    private LocalDate playedDate;
    public Scoreboard(int userId, int score, LocalDate playedDate) {
        this.userId = userId;
        this.score = score;
        this.playedDate = playedDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public LocalDate getPlayedDate() {
        return playedDate;
    }

    public void setPlayedDate(LocalDate playedDate) {
        this.playedDate = playedDate;
    }
}
