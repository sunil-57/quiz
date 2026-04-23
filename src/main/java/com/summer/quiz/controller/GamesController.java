package com.summer.quiz.controller;

import com.summer.quiz.models.Questions;
import com.summer.quiz.models.User;
import com.summer.quiz.services.GamesService;
import com.summer.quiz.services.QuestionsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/games")
public class GamesController {
    @Autowired
    private QuestionsService questionsService;

    @Autowired
    private GamesService gamesService;

    @GetMapping("/{quizId}/{questionIndex}")
    public String playQuiz(
            @PathVariable int quizId,
            @PathVariable int questionIndex,
            Model model) {
        //TODO
        // user needs to log in to start quiz
        List<Questions> questions = questionsService.getQuestions(quizId);

        if (questionIndex < 0 || questionIndex > questions.size()) {
            return "redirect:/quizzes";
        }

        Questions question = questions.get(questionIndex-1);

        model.addAttribute("question", question);
        model.addAttribute("questionIndex", questionIndex);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("quizId", quizId);

        return "users/play-quiz";
    }
    @PostMapping("/check/{quizId}/{questionIndex}")
    public String checkAnswer(
            @PathVariable int quizId,
            @PathVariable int questionIndex,
            @RequestParam("questionId") int questionId,
            @RequestParam("selectedOption") String selectedOption,
            @RequestParam("isLast") int isLast,
            @RequestParam("userId") int userId,
            HttpSession session) {
        Integer score = (Integer) session.getAttribute("score");
        if (score == null) {
            score = 0;
        }

        Map<Integer, String> answers = (Map<Integer, String>) session.getAttribute("answers");
        if (answers == null) {
            answers = new HashMap<>();
        }

        // store answer
        answers.put(questionIndex, selectedOption);

        // update score
        score = questionsService.calculateScore(questionId, selectedOption, score);

        session.setAttribute("score", score);
        session.setAttribute("answers", answers);


        if (isLast == 1) {
            gamesService.saveScore(userId, quizId, score);

            // optional: clear session
            session.removeAttribute("score");
            session.removeAttribute("answers");

            return "redirect:/result/" + quizId;
        }

        // next question
        return "redirect:/games/" + quizId + "/" + (questionIndex + 1);
    }
}
