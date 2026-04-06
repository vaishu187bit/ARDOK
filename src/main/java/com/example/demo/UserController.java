package com.example.demo;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/status")
    public Map<String, Object> getUserStatus(@AuthenticationPrincipal OAuth2User principal) {
        Map<String, Object> response = new HashMap<>();

        // If user is not logged in, return loggedIn: false (no redirect, no error)
        if (principal == null) {
            response.put("loggedIn", false);
            return response;
        }

        String email = principal.getAttribute("email");
        String name = principal.getAttribute("name");

        // Find or create user in database
        User user = userRepository.findByEmail(email).orElseGet(() -> {
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setName(name);
            newUser.setQuizCompleted(false);  // New users must complete quiz first
            return userRepository.save(newUser);
        });

        response.put("loggedIn", true);
        response.put("name", user.getName());
        response.put("quizCompleted", user.isQuizCompleted());

        return response;
    }

    // Called when user finishes the onboarding quiz
    @PostMapping("/complete-quiz")
    public Map<String, Object> completeQuiz(@AuthenticationPrincipal OAuth2User principal) {
        Map<String, Object> response = new HashMap<>();
        if (principal == null) {
            response.put("success", false);
            return response;
        }
        String email = principal.getAttribute("email");
        userRepository.findByEmail(email).ifPresent(user -> {
            user.setQuizCompleted(true);
            userRepository.save(user);
        });
        response.put("success", true);
        return response;
    }
}
