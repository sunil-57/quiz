package com.summer.quiz.controller;

import com.summer.quiz.models.User;
import com.summer.quiz.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/all")
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute User user,
                               BindingResult result,
                               @RequestParam String confirmPassword,
                               Model model) {
        //TODO handle unique username registration when signing up
        if (!confirmPassword.equals(user.getPassword())) {
            result.rejectValue("password", "error.user", "Passwords do not match");
        }

        // If there are validation errors
        if (result.hasErrors()) {
            model.addAttribute("errors", result);
            return "sign-up"; // Return the form with error messages
        }

        userService.registerUser(user);
        return "redirect:/log-in";
    }


    @PostMapping("/log-in")
    public String authenticateUser(@RequestParam String username,
                                   @RequestParam String password,
                                   HttpSession session,
                                   Model model){
        User user = userService.authenticate(username, password);

        if (user != null) {
            session.setAttribute("user", user);
            if (user.isAdmin()) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/quiz";
            }
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "log-in";
        }
    }

    @GetMapping("/log-out")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/log-in";
    }
}
