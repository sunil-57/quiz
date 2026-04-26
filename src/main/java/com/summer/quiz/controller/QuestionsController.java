package com.summer.quiz.controller;

import com.summer.quiz.models.Questions;
import com.summer.quiz.models.Quiz;
import com.summer.quiz.services.QuestionsService;
import com.summer.quiz.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("quizzes/{quizId}/questions")
public class QuestionsController {

    @Autowired
    private QuizService quizService;

    @Autowired
    private QuestionsService questionsService;

    @GetMapping
    public String getQuesstions(@PathVariable("quizId") int quizId, Model model){
        model.addAttribute("quiz",quizService.getQuizById(quizId));
        model.addAttribute("questions", questionsService.getQuestions(quizId));
        return "users/quiz-questions";
    }

    @PostMapping
    public String saveQuestions(@PathVariable("quizId") int quizId,
                                 @ModelAttribute Questions question,
                                 Model model){
        Quiz quiz = quizService.getQuizById(quizId);
        if (quiz == null) {
            model.addAttribute("error", "Quiz not found");
            return "redirect:/quizzes/"+quizId+"/create-question";
        }
        question.setQuiz(quiz);
        model.addAttribute("savedQuestion",questionsService.saveQuestion(question));
        model.addAttribute("questions", questionsService.getQuestions(quizId));
        return "redirect:/quizzes/"+quizId+"/create-question";
    }

    @PutMapping("/{questionId}")
    public String updateQuestion(@PathVariable int quizId,
                                 @PathVariable int questionId,
                                 @ModelAttribute Questions question,
                                 RedirectAttributes redirectAttributes) {

        question.setQuestionId(questionId);
        question.setQuiz(quizService.getQuizById(quizId));
        questionsService.saveQuestion(question);
        redirectAttributes.addFlashAttribute("success", "Option saved successfully");
        return "redirect:/quizzes/" + quizId + "/questions";
    }
}
