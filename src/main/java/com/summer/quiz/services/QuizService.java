package com.summer.quiz.services;

import com.summer.quiz.models.Quiz;
import com.summer.quiz.repositories.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {

    @Autowired
    private QuizRepository quizRepository;

    public List<Quiz> getAllQuizzes() {
        return quizRepository.findAll();
    }

    public Quiz saveQuiz(Quiz quiz) {
       return quizRepository.save(quiz);
    }

    public List<Quiz> findQuizzesByUserId(int userId) {
        return quizRepository.findByUserUserid(userId);
    }

    public List<Quiz> getQuizzesByCategoryName(String categoryName) {
        return quizRepository.findByCategoryCategoryName(categoryName);
    }

    public void toggleStatus(int quizId) {
        Quiz quiz = quizRepository.findById(quizId)
                .orElseThrow(() -> new RuntimeException("Quiz not found"));
        quiz.setStatus(!quiz.isStatus());

        quizRepository.save(quiz);
    }

    public List<Quiz> getQuizzesByCategoryNameAndUserId(String categoryName, int userId) {
        return quizRepository.findByCategoryCategoryNameAndUserUserid(categoryName,userId);
    }

    public Quiz getQuizById(int quizId) {
        return quizRepository.findById(quizId)
                .orElseThrow(() -> new RuntimeException("Quiz not found: " + quizId));
    }
}
