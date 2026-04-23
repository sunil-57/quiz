package com.summer.quiz.services;

import com.summer.quiz.models.Games;
import com.summer.quiz.models.Quiz;
import com.summer.quiz.models.User;
import com.summer.quiz.repositories.GamesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GamesService {
    @Autowired
    private GamesRepository gamesRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private QuizService quizService;

    public Games saveScore(Integer userId, int quizId, Integer score) {
        User user = userService.getUserById(userId);
        Quiz quiz = quizService.getQuizById(quizId);

        Games game = new Games();
        game.setUser(user);
        game.setQuiz(quiz);
        game.setScore(score);

        return gamesRepository.save(game);
    }
}
