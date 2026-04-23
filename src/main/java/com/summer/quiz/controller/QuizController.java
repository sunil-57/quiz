package com.summer.quiz.controller;

import com.summer.quiz.models.Category;
import com.summer.quiz.models.Questions;
import com.summer.quiz.models.Quiz;
import com.summer.quiz.models.User;
import com.summer.quiz.services.CategoryService;
import com.summer.quiz.services.QuestionsService;
import com.summer.quiz.services.QuizService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("quizzes")
public class QuizController {
    @Autowired
    private QuizService quizService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private QuestionsService questionsService;

    @GetMapping("/{userId}")
    public String myQuizzes(@PathVariable("userId") int userId, @RequestParam(value = "category", required = false) String categoryName, Model model){
        List<Quiz> userQuizzes = quizService.findQuizzesByUserId(userId);
        return prepareQuizView(model, categoryName, userQuizzes, "users/my-quizzes");
    }

    @GetMapping
    public String allQuizzes(@RequestParam(value = "category", required = false) String categoryName, Model model){
        List<Quiz> allQuizzes = quizService.getAllQuizzes();
        return prepareQuizView(model, categoryName, allQuizzes, "all-quizzes");
    }

    @PostMapping
    public String saveQuiz(@ModelAttribute Quiz quiz, HttpSession session){
        User loggedInUser = (User) session.getAttribute("loggedInUser"); // Ensure this is set at login
        if (loggedInUser == null) {
            return "redirect:/log-in";
        }
        quiz.setUser(loggedInUser);
        int quizId = quizService.saveQuiz(quiz).getQuizId();
        return "redirect:/quizzes/"+quizId+"/create-question";
    }

    @PutMapping("/{quizId}")
    public String toggleQuizStatus(@PathVariable int quizId, RedirectAttributes redirectAttributes, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/log-in";
        }
        try {
            quizService.toggleStatus(quizId);
            redirectAttributes.addFlashAttribute("message", "Quiz status updated successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update quiz status.");
        }
        return "redirect:/quizzes/" + loggedInUser.getUserid();
    }

    private String prepareQuizView(Model model, String categoryName, List<Quiz> quizzes, String viewName) {
        List<Category> categories = categoryService.getAllCategories();
        List<Quiz> filteredQuizzes;
        if (categoryName != null && !categoryName.isEmpty()) {
            filteredQuizzes = quizzes.stream()
                    .filter(q -> q.getCategory().getCategoryName().equalsIgnoreCase(categoryName))
                    .toList();
        } else {
            filteredQuizzes = quizzes;
        }
        Map<String, Long> categoryCounts = quizzes.stream()
                .collect(Collectors.groupingBy(q -> q.getCategory().getCategoryName(), Collectors.counting()));

        model.addAttribute("categories", categories);
        model.addAttribute("quizzes", filteredQuizzes);
        model.addAttribute("quizCount", quizzes.size());
        model.addAttribute("categoryCounts", categoryCounts);
        model.addAttribute("selectedCategoryName", categoryName);

        return viewName;
    }


}
